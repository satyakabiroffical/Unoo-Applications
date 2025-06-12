import 'package:flutter/material.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/utils/Custom_buttons.dart';
import 'package:unno/utils/custom_text.dart';

class KycScreen extends StatefulWidget {
  const KycScreen({super.key});

  @override
  State<KycScreen> createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteFontColor,
      appBar: AppBar(backgroundColor: AppColors.whiteFontColor),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //space
            SizedBox(height: w * .1),
            SizedBox(
              height: w * 1.14,
              child: Stack(
                children: [
                  //image
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      child: Image.asset(
                        'assets/images/KYC.png',
                        width: w * .7,
                        height: w * .7,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  //container
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: w * .5,
                      width: w,

                      foregroundDecoration: BoxDecoration(
                        color: const Color.fromARGB(73, 28, 200, 243),
                        borderRadius: BorderRadius.circular(w * .02),
                      ),

                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: w * .010,
                            spreadRadius: w * .001,
                            offset: const Offset(3, 5),
                          ),
                        ],
                      ),

                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: w * .06),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                //title
                                AppFonts.textInter(
                                  context,
                                  "Complete your KYC(E-Verify Aadhaar)",
                                  w * .038,
                                  FontWeight.w600,
                                  AppColors.blackFontColor,
                                  TextAlign.center,
                                  TextOverflow.ellipsis,
                                ),
                                SizedBox(height: w * .05),
                                AppFonts.textInter(
                                  context,
                                  "Submit the required KYC documents to get your fundraiser approved",
                                  w * .034,
                                  FontWeight.w500,
                                  AppColors.blackFontColor.withOpacity(0.9),
                                  TextAlign.center,
                                  TextOverflow.visible,
                                ),
                              ],
                            ),

                            SizedBox(
                              width: w * .5,
                              child: AppButtons.loginLike(
                                context,
                                () {},
                                AppFonts.textInter(
                                  context,
                                  'E-Verify Aadhaar',
                                  w * .04,
                                  FontWeight.w500,
                                  AppColors.whiteFontColor,
                                  TextAlign.center,
                                  TextOverflow.ellipsis,
                                ),
                                AppColors.primaryColor,
                                false,
                                w * .110,
                                w * .015,
                              ),
                            ),
                          ],
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
    );
  }
}
