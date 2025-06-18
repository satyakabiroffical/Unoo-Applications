import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/controller/addScreen.controller.dart';
import 'package:unno/utils/custom_text.dart';
import 'package:video_player/video_player.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final AddScreenController controller = Get.put(AddScreenController());

  @override
  void initState() {
    // TODO: implement initState
    controller.loadVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.whiteFontColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteFontColor,
        title: AppFonts.textInter(
          context,
          'New post',
          width * .045,
          FontWeight.w600,
          AppColors.blackFontColor,
          TextAlign.start,
          TextOverflow.ellipsis,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .04),
            child: Image.asset(
              "assets/icons/send.png",
              width: width * .075,
              height: width * .075,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .04),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // Video player container
              Obx(
                () => Container(
                  height: width * .9,
                  width: width,
                  decoration: BoxDecoration(
                    color: AppColors.shadowColor,
                    borderRadius: BorderRadius.circular(width * .04),
                  ),
                  child:
                      controller.videoController.value == null ||
                              !controller
                                  .videoController
                                  .value!
                                  .value
                                  .isInitialized
                          ? Center(
                            child: AppFonts.textInter(
                              context,
                              'Add Image',
                              width * .045,
                              FontWeight.w600,
                              AppColors.blackFontColor,
                              TextAlign.start,
                              TextOverflow.ellipsis,
                            ),
                          )
                          : Stack(
                            children: [
                              Center(
                                child: AspectRatio(
                                  aspectRatio:
                                      controller
                                          .videoController
                                          .value!
                                          .value
                                          .aspectRatio,
                                  child: VideoPlayer(
                                    controller.videoController.value!,
                                  ),
                                ),
                              ),
                              if (controller.isVideoInitializing.value)
                                Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                            ],
                          ),
                ),
              ),
              SizedBox(height: width * .04),

              // Video grid
              Obx(
                () => GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: width * .04,
                    mainAxisSpacing: width * .04,
                    childAspectRatio: 0.7,
                  ),
                  itemCount:
                      controller.isLoading.value ? 6 : controller.videos.length,
                  itemBuilder: (context, index) {
                    if (controller.isLoading.value) {
                      return Skeletonizer(
                        enabled: true,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * .015),
                            color: AppColors.shadowColor,
                          ),
                        ),
                      );
                    }

                    return FutureBuilder<Uint8List?>(
                      future: controller.videos[index].thumbnailDataWithSize(
                        const ThumbnailSize(200, 200),
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * .015),
                              color: AppColors.shadowColor,
                            ),
                          );
                        }

                        if (snapshot.hasError || !snapshot.hasData) {
                          return Container();
                        }

                        return Obx(
                          () => InkWell(
                            onTap: () {
                              controller.initializeVideoController(index);
                            },
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    width * .02,
                                  ),
                                  child: Image.memory(
                                    snapshot.data!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                if (controller.selectedIndex.value ==
                                    index) ...[
                                  // Positioned.fill(
                                  //   child: Container(
                                  //     color: Colors.black.withOpacity(0.3),
                                  //   ),
                                  // ),
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: Icon(
                                      Icons.check_circle,
                                      color: AppColors.primaryColor,
                                      size: width * .04,
                                    ),
                                  ),
                                  if (controller.isVideoInitializing.value &&
                                      controller.selectedIndex.value == index)
                                    Center(),
                                ],
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
