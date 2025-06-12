import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';

class AddScreenController extends GetxController {
  // Videos list
  RxList<AssetEntity> videos = <AssetEntity>[].obs;

  // Video player controller
  Rxn<VideoPlayerController> videoController = Rxn<VideoPlayerController>();

  // Loading states
  RxBool isLoading = false.obs;
  RxBool isVideoInitializing = false.obs;

  // Track if videos have been loaded
  RxBool videosLoaded = false.obs;

  // Selected video index
  RxInt selectedIndex = (-1).obs;

  // Cache for video files
  final Map<int, File> _videoFileCache = {};

  @override
  void onClose() {
    videoController.value?.dispose();
    _videoFileCache.clear();
    super.onClose();
  }

  Future<void> loadVideos() async {
    if (videosLoaded.value) return;

    isLoading.value = true;

    try {
      // Check and request appropriate permissions
      final hasPermission = await _requestMediaPermissions();
      if (!hasPermission) {
        return;
      }

      final albums = await PhotoManager.getAssetPathList(
        type: RequestType.video,
        onlyAll: true,
      );

      if (albums.isEmpty) return;

      final fetchedVideos = await albums.first.getAssetListPaged(
        page: 0,
        size: 100,
      );

      videos.assignAll(fetchedVideos);
      videosLoaded.value = true;

      // Pre-cache the first video
      if (videos.isNotEmpty) {
        await _cacheVideoFile(0);
        await initializeVideoController(0);
      }
    } catch (e) {
      debugPrint('Error fetching videos: $e');
      // Consider showing an error to the user
      Get.snackbar('Error', 'Failed to load videos');
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> _requestMediaPermissions() async {
    if (!Platform.isAndroid) return true;

    try {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      Permission permission;

      if (androidInfo.version.sdkInt >= 33) {
        // Android 13+ (API 33+) needs READ_MEDIA_VIDEO
        permission = Permission.videos;
      } else {
        // Android <= 12 uses storage permission
        permission = Permission.storage;
      }

      final status = await permission.request();

      if (status.isPermanentlyDenied) {
        await openAppSettings();
        return false;
      }

      return status.isGranted;
    } catch (e) {
      debugPrint('Permission error: $e');
      return false;
    }
  }

  Future<void> initializeVideoController(int index) async {
    if (isVideoInitializing.value || index == selectedIndex.value) return;

    isVideoInitializing.value = true;

    try {
      // Get from cache or load if not cached
      if (!_videoFileCache.containsKey(index)) {
        await _cacheVideoFile(index);
      }

      final file = _videoFileCache[index];
      if (file == null) return;

      final newController = VideoPlayerController.file(file);
      await newController.initialize();

      // Dispose old controller only after new one is ready
      videoController.value?.dispose();
      videoController.value = newController;
      await newController.play();

      selectedIndex.value = index;
    } catch (e) {
      debugPrint('Error initializing video: $e');
    } finally {
      isVideoInitializing.value = false;
    }
  }

  Future<void> _cacheVideoFile(int index) async {
    if (_videoFileCache.containsKey(index)) return;

    final file = await videos[index].file;
    if (file != null) {
      _videoFileCache[index] = file;
    }
  }
}
