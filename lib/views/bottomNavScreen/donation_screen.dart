import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/controller/bottomNav.controller.dart';
import 'package:unno/utils/RouteTransition.dart';
import 'package:unno/utils/custom_slide.dart';
import 'package:unno/utils/custom_text.dart';
import 'package:unno/views/donationRelated/fundDetail_screen.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  BottomNavController bottomNavController = Get.find<BottomNavController>();
  late ScrollController _scrollController;
  double _lastScrollOffset = 0.0;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _scrollController.addListener(() {
      double currentOffset = _scrollController.offset;

      // If user is near top, always show bottom nav
      if (currentOffset <= 10) {
        bottomNavController.countPixal.value = true;
      } else {
        // Detect scroll direction
        if (currentOffset > _lastScrollOffset + 5) {
          // Scrolling Down
          bottomNavController.countPixal.value = false;
        } else if (currentOffset < _lastScrollOffset - 5) {
          // Scrolling Up
          bottomNavController.countPixal.value = true;
        }
      }

      _lastScrollOffset = currentOffset;
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteFontColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteFontColor,
        centerTitle: true,
        title: AppFonts.textInter(
          context,
          'My Fundraisers',
          w * .045,
          FontWeight.w600,
          AppColors.blackFontColor,
          TextAlign.center,
          TextOverflow.ellipsis,
        ),
      ),

      body: ListView.builder(
        itemCount: 10,
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * .05,
              vertical: w * .02,
            ),
            child: commonCard(
              "3 year daughter suffering from blood cancer......   ",
              "24 days left",
              "1000",
              "2000",
              () {},
              () {
                Navigator.push(
                  context,
                  SlideLeftRoute(page: FundDetailScreen(id: "")),
                );
              },
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
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.whiteFontColor,
        borderRadius: BorderRadius.circular(w * .01),
        border: Border.all(color: AppColors.primaryColor, width: w * .003),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: w * .01,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * .03,
              vertical: w * .02,
            ),
            child: Row(
              children: [
                //pic
                Image.asset(
                  'assets/images/historyPic1.png',
                  width: w * .24,
                  height: w * .26,
                  fit: BoxFit.cover,
                ),

                SizedBox(width: w * .01),

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
                            w * .029,
                            FontWeight.w600,
                            AppColors.primaryColor,
                            TextAlign.start,
                            TextOverflow.ellipsis,
                          ),
                          AppFonts.textInter(
                            context,
                            "Goal ₹$targetAmount",
                            w * .029,
                            FontWeight.w400,
                            AppColors.blackFontColor,
                            TextAlign.start,
                            TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: w * .01),
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
          ),

          //view button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //edit button
              Image.asset(
                'assets/icons/myFundEdit.png',
                width: w * .06,
                height: w * .06,
                fit: BoxFit.cover,
                color: AppColors.primaryColor,
              ),
              SizedBox(width: w * .02),
              //view button
              IntrinsicWidth(
                child: InkWell(
                  onTap: youDonated,
                  child: Container(
                    height: w * .08,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(w * .02),
                      ),
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
                            color: AppColors.whiteFontColor,
                          ),
                          SizedBox(width: w * .02),

                          //text
                          AppFonts.textInter(
                            context,
                            "View Fundraiser",
                            w * .032,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
