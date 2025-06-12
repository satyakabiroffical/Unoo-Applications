import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/utils/RouteTransition.dart';
import 'package:unno/utils/custom_text.dart';
import 'package:unno/views/profileRelated/reelProfile_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:permission_handler/permission_handler.dart';

class ReelScreen extends StatefulWidget {
  const ReelScreen({super.key});

  @override
  State<ReelScreen> createState() => _ReelScreenState();
}

class _ReelScreenState extends State<ReelScreen> {
  final PageController _pageController = PageController();
  List<AssetEntity> videos = [];
  List<VideoPlayerController> controllers = [];
  int currentPage = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadVideos();
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _loadVideos() async {
    setState(() => isLoading = true);

    try {
      // Check and request appropriate permissions based on Android version
      final bool hasPermission = await _requestMediaPermissions();
      if (!hasPermission) {
        setState(() => isLoading = false);
        return;
      }

      final albums = await PhotoManager.getAssetPathList(
        type: RequestType.video,
        onlyAll: true,
      );

      if (albums.isEmpty) {
        setState(() => isLoading = false);
        return;
      }

      final fetchedVideos = await albums.first.getAssetListPaged(
        page: 0,
        size: 20, // Load 20 videos initially
      );

      setState(() {
        videos = fetchedVideos;
      });

      // Initialize first 3 videos
      for (int i = 0; i < (videos.length > 3 ? 3 : videos.length); i++) {
        await _initializeController(i);
      }
    } catch (e) {
      debugPrint('Error loading videos: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<bool> _requestMediaPermissions() async {
    if (!Platform.isAndroid) return true;

    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt >= 33) {
      // Android 13+ (API 33+) needs READ_MEDIA_VIDEO permission
      final status = await Permission.videos.request();

      if (status.isPermanentlyDenied) {
        await openAppSettings();
      }

      return status.isGranted;
    } else {
      // Android <= 12 uses storage permission
      final status = await Permission.storage.request();

      if (status.isPermanentlyDenied) {
        await openAppSettings();
      }

      return status.isGranted;
    }
  }

  Future<void> _initializeController(int index) async {
    if (index >= controllers.length) {
      final file = await videos[index].file;
      if (file != null) {
        final controller = VideoPlayerController.file(file);
        await controller.initialize();
        if (index < controllers.length) {
          controllers[index] = controller;
        } else {
          controllers.add(controller);
        }
        if (index == currentPage) {
          controller.play();
        }
        setState(() {});
      }
    }
  }

  void _onPageChanged(int page) {
    // Pause previous video
    if (currentPage < controllers.length) {
      controllers[currentPage].pause();
    }

    currentPage = page;

    // Play new video
    if (currentPage < controllers.length) {
      controllers[currentPage].play();
    }

    // Initialize next videos if needed
    if (currentPage + 1 < videos.length &&
        (currentPage + 1 >= controllers.length)) {
      _initializeController(currentPage + 1);
    }
    if (currentPage + 2 < videos.length &&
        (currentPage + 2 >= controllers.length)) {
      _initializeController(currentPage + 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor, // Black status bar
        statusBarIconBrightness: Brightness.light, // White icons
        statusBarBrightness: Brightness.dark, // For iOS compatibility
      ),
    );
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        height: w * .200,
        color: Colors.transparent,
      ),
      body:
          isLoading
              ? const Center(child: SizedBox())
              : SafeArea(
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  itemCount: videos.length,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (context, index) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        // Video Player
                        if (index < controllers.length)
                          Center(
                            child: AspectRatio(
                              aspectRatio: controllers[index].value.aspectRatio,
                              child: VideoPlayer(controllers[index]),
                            ),
                          ),
                        // else
                        //   const Center(child: CircularProgressIndicator()),

                        // Caption Section (like your image)

                        // Right side action buttons (like, comment, share)
                        Positioned(
                          bottom: 180,
                          right: 16,
                          child: Column(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 32,
                                ),
                                onPressed: () {},
                              ),
                              AppFonts.textInter(
                                context,
                                "12.5K",
                                w * .030,
                                FontWeight.w500,
                                Colors.white,
                                TextAlign.center,
                                TextOverflow.ellipsis,
                              ),
                              SizedBox(height: w * .040),
                              Image.asset(
                                "assets/icons/comments.png",
                                height: w * .070,
                                width: w * .070,
                                color: Colors.white,
                              ),
                              AppFonts.textInter(
                                context,
                                "1.2K",
                                w * .030,
                                FontWeight.w500,
                                Colors.white,
                                TextAlign.center,
                                TextOverflow.ellipsis,
                              ),
                              SizedBox(height: w * .040),
                              Image.asset(
                                "assets/icons/share.png",
                                height: w * .070,
                                width: w * .070,
                                color: Colors.white,
                              ),
                              AppFonts.textInter(
                                context,
                                "20",
                                w * .030,
                                FontWeight.w500,
                                Colors.white,
                                TextAlign.center,
                                TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 40,
                          left: 16,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // circular profile
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    SlideLeftRoute(page: ReelProfileScreen()),
                                  );
                                },
                                child: Container(
                                  height: w * .100,
                                  width: w * .100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/icons/reelProfile.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                              // space
                              SizedBox(width: w * .020),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppFonts.textInter(
                                    context,
                                    "Roshani Sharma",
                                    w * .040,
                                    FontWeight.w500,
                                    AppColors.whiteFontColor,
                                    TextAlign.start,
                                    TextOverflow.ellipsis,
                                  ),

                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        SlideLeftRoute(
                                          page: ReelProfileScreen(),
                                        ),
                                      );
                                    },
                                    child: SizedBox(
                                      width: w * .800,
                                      child: RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                          style: TextStyle(
                                            color: AppColors.whiteFontColor,
                                            fontSize: w * .035,
                                          ),
                                          children: [
                                            const TextSpan(
                                              text:
                                                  'here is my caption to write down and I am sharing  my feeling what I am going through',
                                            ),
                                            TextSpan(
                                              text: ' Learn more',
                                              style: TextStyle(
                                                color: AppColors.whiteFontColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: w * .035,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // username
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
    );
  }
}
