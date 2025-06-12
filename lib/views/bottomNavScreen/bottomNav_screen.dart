import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/controller/bottomNav.controller.dart';
import 'package:unno/utils/custom_text.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});
  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  BottomNavController bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.whiteFontColor,
      body: Stack(
        children: [
          // main screen
          Obx(
            () =>
                bottomNavController.screens[bottomNavController
                    .currentIndex
                    .value],
          ),

          // bottom Navigation bar
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              bottom:
                  !bottomNavController.countPixal.value ? -h * 0.12 : w * 0.02,
              left: w * 0.02,
              right: w * 0.02,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: w * .040,
                    // vertical: w * .010,
                  ),
                  child: Container(
                    height: w * .213,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        // bottom navigation bar
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(w * .020),
                            ),
                            height: w * .180,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Image.asset(
                                    'assets/icons/BG.png',
                                    fit: BoxFit.contain,
                                    color: AppColors.primaryColor,
                                    height: w * .180,
                                  ),
                                ),

                                Obx(
                                  () => Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // first set of icons
                                      SizedBox(
                                        width: w * .350,
                                        height: w * .180,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                bottomNavController
                                                    .currentIndex
                                                    .value = 0;
                                              },
                                              child: SizedBox(
                                                height: w * .150,
                                                width: w * .150,
                                                child:
                                                    bottomNavController
                                                                .currentIndex
                                                                .value ==
                                                            0
                                                        ? Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                w * .038,
                                                              ),
                                                          child: Image.asset(
                                                            'assets/icons/homeFill.png',
                                                            fit: BoxFit.contain,
                                                            height: w * .070,
                                                            width: w * .070,
                                                          ),
                                                        )
                                                        : Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                w * .038,
                                                              ),
                                                          child: Image.asset(
                                                            'assets/icons/home.png',
                                                            fit: BoxFit.contain,
                                                            height: w * .070,
                                                            width: w * .070,
                                                          ),
                                                        ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                bottomNavController
                                                    .currentIndex
                                                    .value = 1;
                                              },
                                              child: SizedBox(
                                                height: w * .150,
                                                width: w * .150,
                                                child:
                                                    bottomNavController
                                                                .currentIndex
                                                                .value ==
                                                            1
                                                        ? Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                w * .038,
                                                              ),
                                                          child: Image.asset(
                                                            'assets/icons/reelFill.png',
                                                            fit: BoxFit.contain,
                                                            height: w * .070,
                                                            width: w * .070,
                                                          ),
                                                        )
                                                        : Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                w * .038,
                                                              ),
                                                          child: Image.asset(
                                                            'assets/icons/reel.png',
                                                            fit: BoxFit.contain,
                                                            height: w * .070,
                                                            width: w * .070,
                                                          ),
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // second set of icons
                                      SizedBox(
                                        width: w * .350,
                                        height: w * .180,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                bottomNavController
                                                    .currentIndex
                                                    .value = 3;
                                              },
                                              child: SizedBox(
                                                height: w * .150,
                                                width: w * .150,
                                                child:
                                                    bottomNavController
                                                                .currentIndex
                                                                .value ==
                                                            3
                                                        ? Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                w * .038,
                                                              ),
                                                          child: Image.asset(
                                                            'assets/icons/donationFill.png',
                                                            fit: BoxFit.contain,
                                                            height: w * .070,
                                                            width: w * .070,
                                                          ),
                                                        )
                                                        : Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                w * .038,
                                                              ),
                                                          child: Image.asset(
                                                            'assets/icons/donation.png',
                                                            fit: BoxFit.contain,
                                                            height: w * .070,
                                                            width: w * .070,
                                                          ),
                                                        ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                bottomNavController
                                                    .currentIndex
                                                    .value = 4;
                                              },
                                              child: SizedBox(
                                                height: w * .150,
                                                width: w * .150,
                                                child:
                                                    bottomNavController
                                                                .currentIndex
                                                                .value ==
                                                            4
                                                        ? Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                w * .038,
                                                              ),
                                                          child: Image.asset(
                                                            'assets/icons/profileFill.png',
                                                            fit: BoxFit.contain,
                                                            height: w * .070,
                                                            width: w * .070,
                                                          ),
                                                        )
                                                        : Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                w * .038,
                                                              ),
                                                          child: Image.asset(
                                                            'assets/icons/profile.png',
                                                            fit: BoxFit.contain,
                                                            height: w * .070,
                                                            width: w * .070,
                                                          ),
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // middle button
                        Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap:
                                () =>
                                    bottomNavController.currentIndex.value = 2,
                            child: Container(
                              height: w * .150,
                              width: w * .150,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primaryColor.withOpacity(
                                      0.2,
                                    ),
                                    blurRadius: w * .025,
                                    spreadRadius: w * .015,
                                    offset: Offset(0, w * .010),
                                  ),
                                ],
                                shape: BoxShape.circle,
                                color: AppColors.whiteFontColor,
                              ),
                              child: AppFonts.textInter(
                                context,
                                '+',
                                w * .100,
                                FontWeight.w200,
                                AppColors.primaryColor,
                                TextAlign.center,
                                TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
