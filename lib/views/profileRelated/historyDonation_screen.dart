import 'package:flutter/material.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/utils/custom_slide.dart';
import 'package:unno/utils/custom_text.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteFontColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteFontColor,
        title: AppFonts.textInter(
          context,
          "History donation",
          w * .045,
          FontWeight.w600,
          AppColors.blackFontColor,
          TextAlign.start,
          TextOverflow.ellipsis,
        ),
      ),

      body: ListView.builder(
        itemCount: 3,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * .05,
              vertical: w * .02,
            ),
            child: commonCard(
              "My Baby Battles For His Life And We Need Your Support To...",
              "24 day left",
              "47726",
              "64705",
              () {},
              () {},
            ),
          );
        },
      ),
    );
  }

  //common card
  Widget commonCard(
    String title,
    String daysLeft,
    String raisedAmount,
    String targetAmount,
    void Function() onTapView,
    void Function() youDonated,
  ) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w,
      decoration: BoxDecoration(
        color: AppColors.whiteFontColor,
        borderRadius: BorderRadius.circular(w * .02),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: w * .01,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .03, vertical: w * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                //pic
                Image.asset(
                  'assets/images/historyPic1.png',
                  width: w * .24,
                  height: w * .24,
                  fit: BoxFit.cover,
                ),

                SizedBox(width: w * .02),

                //column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: w * .58,
                      child: AppFonts.textInter(
                        context,
                        title,
                        w * .036,
                        FontWeight.w600,
                        AppColors.blackFontColor,
                        TextAlign.start,
                        TextOverflow.visible,
                      ),
                    ),

                    //textwhich shows days left
                    SizedBox(width: w * .02),

                    //text
                    AppFonts.textInter(
                      context,
                      daysLeft,
                      w * .023,
                      FontWeight.w600,
                      AppColors.redColor,
                      TextAlign.start,
                      TextOverflow.ellipsis,
                    ),

                    SizedBox(height: w * .02),

                    //row
                    SizedBox(
                      width: w * .58,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //text
                          AppFonts.textInter(
                            context,
                            "₹$raisedAmount Raised",
                            w * .032,
                            FontWeight.w600,
                            AppColors.primaryColor,
                            TextAlign.start,
                            TextOverflow.ellipsis,
                          ),
                          AppFonts.textInter(
                            context,
                            "Goal ₹$targetAmount",
                            w * .032,
                            FontWeight.w400,
                            AppColors.blackFontColor,
                            TextAlign.start,
                            TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: w * .02),
                    CustomSlide.customSlideTransition(
                      context: context,
                      nowNumber: double.parse(raisedAmount),
                      totalNumber: double.parse(targetAmount),
                      width: w * .58,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: w * .02),

            //view button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //view button
                IntrinsicWidth(
                  child: Container(
                    height: w * .08,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: w * .002,
                      ),
                      borderRadius: BorderRadius.circular(w * .01),
                    ),

                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * .03),
                      child: Row(
                        children: [
                          //Image
                          Image.asset(
                            'assets/icons/checkFundraiser.png',
                            width: w * .05,
                            height: w * .05,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: w * .02),

                          //text
                          AppFonts.textInter(
                            context,
                            "View Fundraiser",
                            w * .032,
                            FontWeight.w600,
                            AppColors.primaryColor,
                            TextAlign.center,
                            TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //you donated button
                IntrinsicWidth(
                  child: Container(
                    height: w * .08,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(w * .01),
                    ),

                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * .015),
                      child: Row(
                        children: [
                          //Image
                          Image.asset(
                            'assets/icons/check.png',
                            width: w * .04,
                            height: w * .04,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: w * .02),

                          //text
                          AppFonts.textInter(
                            context,
                            "You Donated \$5,000",
                            w * .030,
                            FontWeight.w600,
                            AppColors.whiteFontColor,
                            TextAlign.center,
                            TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
