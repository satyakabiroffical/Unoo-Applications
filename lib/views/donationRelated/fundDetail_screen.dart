import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/controller/fundDetail.controller.dart';
import 'package:unno/utils/RouteTransition.dart';
import 'package:unno/utils/custom_slide.dart';
import 'package:unno/utils/custom_text.dart';
import 'package:unno/views/donationRelated/contribution_screen.dart';

class FundDetailScreen extends StatefulWidget {
  const FundDetailScreen({super.key});

  @override
  State<FundDetailScreen> createState() => _FundDetailScreenState();
}

class _FundDetailScreenState extends State<FundDetailScreen>
    with SingleTickerProviderStateMixin {
  FundDetailController fundDetailController = Get.put(FundDetailController());
  late TabController tabController;

  @override
  initState() {
    tabController = TabController(vsync: this, length: 3);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteFontColor,
      appBar: AppBar(backgroundColor: AppColors.whiteFontColor),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // pic
                  Container(
                    height: w * 0.5,
                    width: w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w * 0.02),
                      image: DecorationImage(
                        image: AssetImage('assets/images/fundDetail.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //space from top
                  SizedBox(height: w * 0.03),

                  // text days left
                  Row(
                    children: [
                      //clock icon
                      Icon(
                        Icons.access_time,
                        color: AppColors.redColor,
                        size: w * 0.04,
                      ),

                      //text
                      AppFonts.textInter(
                        context,
                        " 28 Days Left",
                        w * 0.030,
                        FontWeight.w600,
                        AppColors.redColor,
                        TextAlign.start,
                        TextOverflow.visible,
                      ),
                    ],
                  ),

                  //space from top
                  SizedBox(height: w * 0.03),

                  // title
                  AppFonts.textInter(
                    context,
                    "My Son Is Fighting For His Life And We Need Your Support To Save Him",
                    w * 0.045,
                    FontWeight.w600,
                    AppColors.blackFontColor,
                    TextAlign.start,
                    TextOverflow.visible,
                  ),

                  //space from top
                  SizedBox(height: w * 0.02),

                  // by some name
                  AppFonts.textInter(
                    context,
                    "by Roshan Sharma",
                    w * 0.033,
                    FontWeight.w500,
                    AppColors.blackFontColor.withOpacity(0.7),
                    TextAlign.start,
                    TextOverflow.visible,
                  ),

                  //space from top
                  SizedBox(height: w * 0.03),

                  //row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _donationCard(
                        context,
                        'Views Today',
                        '0',
                        'assets/icons/vision.png',
                        false,
                      ),
                      _donationCard(
                        context,
                        'Donation Today',
                        '0',
                        'assets/icons/donationToday.png',
                        false,
                      ),
                      _donationCard(
                        context,
                        'Total donors',
                        '0',
                        'assets/icons/totalDonation.png',
                        true,
                      ),
                    ],
                  ),

                  //space from top
                  SizedBox(height: w * 0.03),

                  // container with raised amount
                  IntrinsicHeight(
                    child: Container(
                      width: w,
                      decoration: BoxDecoration(
                        color: AppColors.whiteFontColor,
                        borderRadius: BorderRadius.circular(w * 0.02),
                        border: Border.all(
                          color: Colors.grey.shade100,
                          width: w * 0.002,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100,
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),

                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 0.03,
                          vertical: w * 0.03,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    //text
                                    AppFonts.textInter(
                                      context,
                                      'raised of ',
                                      w * 0.03,
                                      FontWeight.w400,
                                      AppColors.shadowColor.withOpacity(0.4),
                                      TextAlign.start,
                                      TextOverflow.visible,
                                    ),

                                    //text
                                    AppFonts.textInter(
                                      context,
                                      //rupee  ,
                                      '₹ 31,764',
                                      w * 0.035,
                                      FontWeight.w400,
                                      AppColors.primaryColor,
                                      TextAlign.start,
                                      TextOverflow.visible,
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    //text
                                    AppFonts.textInter(
                                      context,
                                      'Goal ₹ ',
                                      w * 0.05,
                                      FontWeight.w700,
                                      AppColors.blackFontColor,
                                      TextAlign.start,
                                      TextOverflow.visible,
                                    ),

                                    //text
                                    AppFonts.textInter(
                                      context,
                                      //rupee  ,
                                      '32,346',
                                      w * 0.05,
                                      FontWeight.w500,
                                      AppColors.blackFontColor,
                                      TextAlign.start,
                                      TextOverflow.visible,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            CustomSlide.customSlideTransition(
                              context: context,
                              nowNumber: 31764,
                              totalNumber: 32346,
                              width: w - w * 0.05 - w * 0.03,
                            ),

                            //space from top
                            SizedBox(height: w * 0.04),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    //text
                                    AppFonts.textInter(
                                      context,
                                      //rupee  ,
                                      '1519',
                                      w * 0.055,
                                      FontWeight.w400,
                                      AppColors.blackFontColor.withOpacity(0.7),
                                      TextAlign.start,
                                      TextOverflow.visible,
                                    ),

                                    //text
                                    AppFonts.textInter(
                                      context,
                                      ' supporters',
                                      w * 0.035,
                                      FontWeight.w400,
                                      AppColors.shadowColor.withOpacity(0.4),
                                      TextAlign.start,
                                      TextOverflow.visible,
                                    ),
                                  ],
                                ),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //text
                                    AppFonts.textInter(
                                      context,
                                      //rupee  ,
                                      '28',
                                      w * 0.055,
                                      FontWeight.w400,
                                      AppColors.blackFontColor.withOpacity(0.7),
                                      TextAlign.start,
                                      TextOverflow.visible,
                                    ),

                                    //text
                                    AppFonts.textInter(
                                      context,
                                      ' Days left',
                                      w * 0.035,
                                      FontWeight.w400,
                                      AppColors.shadowColor.withOpacity(0.4),
                                      TextAlign.start,
                                      TextOverflow.visible,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //space from top
                  SizedBox(height: w * 0.04),

                  //row with 2 buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //contribute button
                      InkWell(
                        onTap: () {
                          //contribute button
                          Navigator.push(
                            context,
                            SlideLeftRoute(page: ContributionScreen()),
                          );
                        },
                        child: Container(
                          height: w * 0.12,
                          width: w * 0.42,

                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(w * 0.02),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //heart icon with white color
                              Icon(
                                Icons.favorite,
                                color: AppColors.whiteFontColor,
                                size: w * 0.04,
                              ),

                              //some space
                              SizedBox(width: w * 0.01),

                              //text with white color
                              AppFonts.textInter(
                                context,
                                'Contribute',
                                w * 0.038,
                                FontWeight.w600,
                                AppColors.whiteFontColor,
                                TextAlign.center,
                                TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          //contribute button
                        },
                        child: Container(
                          height: w * 0.12,
                          width: w * 0.42,

                          decoration: BoxDecoration(
                            color: AppColors.whiteFontColor,
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: w * 0.002,
                            ),
                            borderRadius: BorderRadius.circular(w * 0.02),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //text with white color
                              AppFonts.textInter(
                                context,
                                'Share now',
                                w * 0.038,
                                FontWeight.w600,
                                AppColors.primaryColor,
                                TextAlign.center,
                                TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  //space from top
                  SizedBox(height: w * 0.07),

                  //supporters container
                  Obx(
                    () => IntrinsicHeight(
                      child: Container(
                        width: w * 0.9,
                        decoration: BoxDecoration(
                          color: AppColors.whiteFontColor,
                          borderRadius: BorderRadius.circular(w * 0.02),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadowColor.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),

                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * 0.04,
                            vertical: w * 0.04,
                          ),
                          child: Column(
                            children: [
                              // Row with image and no of supports
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //image
                                  Image.asset(
                                    'assets/icons/contribute1.png',
                                    height: w * 0.065,
                                    width: w * 0.065,
                                  ),

                                  //text
                                  AppFonts.textInter(
                                    context,
                                    ' 100 Supporters',
                                    w * 0.042,
                                    FontWeight.w600,
                                    AppColors.blackFontColor.withOpacity(0.7),
                                    TextAlign.start,
                                    TextOverflow.visible,
                                  ),
                                ],
                              ),

                              //divider line
                              Divider(
                                color: Colors.grey.shade200,
                                thickness: 2,
                                height: w * 0.03,
                              ),

                              //Row with most generous and rescent text and a vertical line in between
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  //most generous text
                                  SizedBox(
                                    width: w / 2.5,
                                    child: Center(
                                      child: AppFonts.textInter(
                                        context,
                                        'Most Generous',
                                        w * 0.042,
                                        FontWeight.w600,
                                        AppColors.primaryColor,
                                        TextAlign.start,
                                        TextOverflow.visible,
                                      ),
                                    ),
                                  ),

                                  //vertical line
                                  Container(
                                    height: w * 0.075,
                                    width: 2,
                                    color: Colors.grey.shade200,
                                  ),

                                  //rescent text
                                  SizedBox(
                                    width: w / 2.5,
                                    child: Center(
                                      child: AppFonts.textInter(
                                        context,
                                        'Rescent',
                                        w * 0.042,
                                        FontWeight.w600,
                                        AppColors.blackFontColor.withOpacity(
                                          0.7,
                                        ),
                                        TextAlign.start,
                                        TextOverflow.visible,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              //space from top
                              SizedBox(height: w * 0.02),

                              //listview builder for supporters
                              SizedBox(
                                height:
                                    fundDetailController.isShowMore.value
                                        ? w * .5
                                        : w * 0.3,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      fundDetailController.isShowMore.value
                                          ? BouncingScrollPhysics()
                                          : NeverScrollableScrollPhysics(),
                                  itemCount:
                                      fundDetailController.isShowMore.value
                                          ? 10
                                          : 3,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        bottom: w * 0.02,
                                        right: w * .020,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //Row with image and name
                                          Row(
                                            children: [
                                              //image
                                              Container(
                                                height: w * 0.065,
                                                width: w * 0.065,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/profile.png',
                                                  height: w * 0.065,
                                                  width: w * 0.065,
                                                ),
                                              ),

                                              //space from left
                                              SizedBox(width: w * 0.020),

                                              //name
                                              AppFonts.textInter(
                                                context,
                                                'Priya Sharma',
                                                w * 0.038,
                                                FontWeight.w600,
                                                AppColors.blackFontColor
                                                    .withOpacity(0.7),
                                                TextAlign.start,
                                                TextOverflow.visible,
                                              ),
                                            ],
                                          ),

                                          //dollar price
                                          AppFonts.textInter(
                                            context,
                                            '\$ 45000',
                                            w * 0.038,
                                            FontWeight.w600,
                                            AppColors.primaryColor,
                                            TextAlign.start,
                                            TextOverflow.visible,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // space from top
                              SizedBox(height: w * 0.015),

                              //row with Show more text and arrow down icon in ios style
                              InkWell(
                                onTap: () {
                                  fundDetailController.isShowMore.value =
                                      !fundDetailController.isShowMore.value;
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //show more text
                                    AppFonts.textInter(
                                      context,
                                      fundDetailController.isShowMore.value
                                          ? 'Show less'
                                          : 'Show more',
                                      w * 0.038,
                                      FontWeight.w600,
                                      AppColors.primaryColor,
                                      TextAlign.start,
                                      TextOverflow.visible,
                                    ),

                                    //space from right
                                    SizedBox(width: w * 0.015),

                                    // ios style arrow down like \/
                                    Icon(
                                      fundDetailController.isShowMore.value
                                          ? Icons.expand_less
                                          : Icons.expand_more,
                                      color: AppColors.primaryColor,
                                      size: w * 0.075,
                                      weight: w * 0.025,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // space from bottom
                  SizedBox(height: w * 0.07),
                  //supporters container
                  Obx(
                    () => IntrinsicHeight(
                      child: Container(
                        width: w * 0.9,
                        decoration: BoxDecoration(
                          color: AppColors.whiteFontColor,
                          borderRadius: BorderRadius.circular(w * 0.02),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadowColor.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),

                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * 0.04,
                            vertical: w * 0.04,
                          ),
                          child: Column(
                            children: [
                              // Row with image and no of supports
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //image
                                  Image.asset(
                                    'assets/icons/prizeCup1.png',
                                    height: w * 0.065,
                                    width: w * 0.065,
                                  ),

                                  //text
                                  AppFonts.textInter(
                                    context,
                                    ' Top Contribution',
                                    w * 0.042,
                                    FontWeight.w600,
                                    AppColors.blackFontColor.withOpacity(0.7),
                                    TextAlign.start,
                                    TextOverflow.visible,
                                  ),
                                ],
                              ),

                              //divider line
                              Divider(
                                color: Colors.grey.shade200,
                                thickness: 2,
                                height: w * 0.03,
                              ),

                              //space from top
                              SizedBox(height: w * 0.02),

                              //listView builder for supporters
                              SizedBox(
                                height:
                                    fundDetailController.isShowTopContr.value
                                        ? w * .500
                                        : w * 0.3,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      fundDetailController.isShowTopContr.value
                                          ? BouncingScrollPhysics()
                                          : NeverScrollableScrollPhysics(),
                                  itemCount:
                                      fundDetailController.isShowTopContr.value
                                          ? 10
                                          : 3,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        bottom: w * 0.02,
                                        right: w * .020,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //Row with image and name
                                          Row(
                                            children: [
                                              //image
                                              Container(
                                                height: w * 0.065,
                                                width: w * 0.065,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/profile.png',
                                                  height: w * 0.065,
                                                  width: w * 0.065,
                                                ),
                                              ),

                                              //space from left
                                              SizedBox(width: w * 0.020),

                                              //name
                                              AppFonts.textInter(
                                                context,
                                                'Priya Sharma',
                                                w * 0.038,
                                                FontWeight.w600,
                                                AppColors.blackFontColor
                                                    .withOpacity(0.7),
                                                TextAlign.start,
                                                TextOverflow.visible,
                                              ),
                                            ],
                                          ),

                                          //dollar price
                                          AppFonts.textInter(
                                            context,
                                            '\$ 45000',
                                            w * 0.038,
                                            FontWeight.w600,
                                            AppColors.primaryColor,
                                            TextAlign.start,
                                            TextOverflow.visible,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // space from top
                              SizedBox(height: w * 0.015),

                              //row with Show more text and arrow down icon in ios style
                              InkWell(
                                onTap: () {
                                  fundDetailController.isShowTopContr.value =
                                      !fundDetailController
                                          .isShowTopContr
                                          .value;
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //show more text
                                    AppFonts.textInter(
                                      context,
                                      fundDetailController.isShowTopContr.value
                                          ? 'Show less'
                                          : 'Show more',
                                      w * 0.038,
                                      FontWeight.w600,
                                      AppColors.primaryColor,
                                      TextAlign.start,
                                      TextOverflow.visible,
                                    ),

                                    //space from right
                                    SizedBox(width: w * 0.015),

                                    // ios style arrow down like \/
                                    Icon(
                                      fundDetailController.isShowTopContr.value
                                          ? Icons.expand_less
                                          : Icons.expand_more,
                                      color: AppColors.primaryColor,
                                      size: w * 0.075,
                                      weight: w * 0.025,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //space from top
            SizedBox(height: w * 0.08),

            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteFontColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: w * 0.02,
                  horizontal: w * 0.02,
                ),
                child: TabBar(
                  controller: tabController,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 3.0,
                      color: AppColors.primaryColor,
                    ),
                    insets: EdgeInsets.only(
                      bottom: 0,
                    ), // Bring underline closer to text
                  ),
                  labelColor: AppColors.primaryColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.black,
                  dividerHeight: 0.0,
                  labelStyle: TextStyle(
                    fontSize: w * .036,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: [
                    Tab(text: "Overview (2)"),
                    Tab(text: "Documents (3)"),
                    Tab(text: "Comments (5)"),
                  ],
                ),
              ),
            ),

            /* Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  // Tab 1: Overview
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 200,
                    ), // Set max height
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                      child: RichText(
                        text: TextSpan(
                          text:
                              "Lorem ipsum dolor sit amet...", // Your long text
                          style: TextStyle(
                            fontSize: w * 0.04,
                            color: AppColors.blackFontColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 200,
                    ), // Set max height
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                      child: RichText(
                        text: TextSpan(
                          text:
                              "Lorem ipsum dolor sit amet...", // Your long text
                          style: TextStyle(
                            fontSize: w * 0.04,
                            color: AppColors.blackFontColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 200,
                    ), // Set max height
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                      child: RichText(
                        text: TextSpan(
                          text:
                              "Lorem ipsum dolor sit amet...", // Your long text
                          style: TextStyle(
                            fontSize: w * 0.04,
                            color: AppColors.blackFontColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ), */

            //space from bottom
            SizedBox(height: w * 0.07),
          ],
        ),
      ),
    );
  }

  Widget _donationCard(
    BuildContext context,
    String title,
    String value,
    String image,
    bool offsetEnd,
  ) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: w * .15,
      width: w * .28,
      decoration: BoxDecoration(
        color: AppColors.whiteFontColor,
        borderRadius: BorderRadius.circular(w * .015),
        border: Border.all(color: Colors.grey.shade100, width: w * 0.002),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 10,
            spreadRadius: 15,
            offset: offsetEnd ? Offset(10, 5) : Offset(8, 10),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //image
              Image.asset(image, height: w * .050, width: w * .050),

              //space from left
              SizedBox(width: w * .025),

              //text
              AppFonts.textInter(
                context,
                value,
                w * .045,
                FontWeight.w500,
                AppColors.blackFontColor.withOpacity(0.7),
                TextAlign.start,
                TextOverflow.ellipsis,
              ),
            ],
          ),

          //space from top
          SizedBox(height: w * .01),

          //text
          AppFonts.textInter(
            context,
            title,
            w * .030,
            FontWeight.w500,
            AppColors.blackFontColor.withOpacity(0.7),
            TextAlign.start,
            TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
