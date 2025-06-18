import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:unno/apis/funds.api.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/controller/fundDetail.controller.dart';
import 'package:unno/models/fundDetails.model.dart';
import 'package:unno/utils/CustomNetworkImage.dart';
import 'package:unno/utils/RouteTransition.dart';
import 'package:unno/utils/custom_slide.dart';
import 'package:unno/utils/custom_text.dart';
import 'package:unno/views/donationRelated/contribution_screen.dart';

class FundDetailScreen extends StatefulWidget {
  String id;
  FundDetailScreen({super.key, required this.id});

  @override
  State<FundDetailScreen> createState() => _FundDetailScreenState();
}

class _FundDetailScreenState extends State<FundDetailScreen>
    with SingleTickerProviderStateMixin {
  FundDetailController fundDetailController = Get.put(FundDetailController());
  FundApi fundApi = Get.put(FundApi());
  late TabController tabController;

  @override
  initState() {
    tabController = TabController(vsync: this, length: 3);
    debugPrint(widget.id);
    fundApi.getFundDetailsById(widget.id);
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
                  Obx(
                    () => Skeletonizer(
                      enabled: fundApi.gettingFundDetails.value,
                      child: Container(
                        height: w * 0.5,
                        width: w,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w * 0.02),
                        ),

                        child: CustomImage.CustImage(
                          fundApi.gettingFundDetails.value
                              ? ""
                              : fundApi
                                  .fundDetailsById
                                  .first
                                  .fundRaise
                                  .addFundraiserImageOrVideo
                                  .isEmpty
                              ? ""
                              : fundApi
                                  .fundDetailsById
                                  .first
                                  .fundRaise
                                  .addFundraiserImageOrVideo
                                  .first,
                          w,
                          w * 0.5,
                          BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  //space from top
                  SizedBox(height: w * 0.03),

                  // text days left
                  Obx(
                    () => Skeletonizer(
                      enabled: fundApi.gettingFundDetails.value,
                      child: Row(
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
                            fundApi.gettingFundDetails.value
                                ? " 28 Days Left"
                                : " ${fundApi.fundDetailsById.first.fundRaise.remainingDays.toString()} Days Left",
                            w * 0.030,
                            FontWeight.w600,
                            AppColors.redColor,
                            TextAlign.start,
                            TextOverflow.visible,
                          ),
                        ],
                      ),
                    ),
                  ),

                  //space from top
                  SizedBox(height: w * 0.03),

                  // title
                  Obx(
                    () => Skeletonizer(
                      enabled: fundApi.gettingFundDetails.value,
                      child: AppFonts.textInter(
                        context,
                        fundApi.gettingFundDetails.value
                            ? "My Son Is Fighting For His Life And We Need Your Support To Save Him"
                            : fundApi.fundDetailsById.first.fundRaise.fundTitle,
                        w * 0.045,
                        FontWeight.w600,
                        AppColors.blackFontColor,
                        TextAlign.start,
                        TextOverflow.visible,
                      ),
                    ),
                  ),

                  //space from top
                  SizedBox(height: w * 0.02),

                  Obx(
                    () => // by some name
                        Skeletonizer(
                      enabled: fundApi.gettingFundDetails.value,
                      child: AppFonts.textInter(
                        context,
                        fundApi.gettingFundDetails.value
                            ? "by Roshan Sharma"
                            : "by ${fundApi.fundDetailsById.first.fundRaise.userId.name}",
                        w * 0.033,
                        FontWeight.w500,
                        AppColors.blackFontColor.withOpacity(0.7),
                        TextAlign.start,
                        TextOverflow.visible,
                      ),
                    ),
                  ),

                  //space from top
                  SizedBox(height: w * 0.03),

                  //row
                  Obx(
                    () => Skeletonizer(
                      enabled: fundApi.gettingFundDetails.value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _donationCard(
                            context,
                            'Views Today',
                            fundApi.gettingFundDetails.value
                                ? '0'
                                : fundApi
                                    .fundDetailsById
                                    .first
                                    .fundRaise
                                    .todayViews
                                    .toString(),
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
                    ),
                  ),

                  //space from top
                  SizedBox(height: w * 0.03),

                  // container with raised amount
                  Obx(
                    () => Skeletonizer(
                      enabled: fundApi.gettingFundDetails.value,
                      child: IntrinsicHeight(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          AppColors.shadowColor.withOpacity(
                                            0.4,
                                          ),
                                          TextAlign.start,
                                          TextOverflow.visible,
                                        ),

                                        //text
                                        AppFonts.textInter(
                                          context,
                                          //rupee  ,
                                          fundApi.gettingFundDetails.value
                                              ? '₹ 31,764'
                                              : "₹ ${fundApi.fundDetailsById.first.fundRaise.totalDonationAmount.toString()}",
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
                                          'Goal ',
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
                                          fundApi.gettingFundDetails.value
                                              ? '₹ 31,764'
                                              : "₹ ${fundApi.fundDetailsById.first.fundRaise.fundRequired.toString()}",
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
                                  nowNumber:
                                      fundApi.gettingFundDetails.value
                                          ? 31764
                                          : fundApi
                                              .fundDetailsById
                                              .first
                                              .fundRaise
                                              .totalDonationAmount
                                              .toDouble(),
                                  totalNumber:
                                      fundApi.gettingFundDetails.value
                                          ? 31764
                                          : fundApi
                                              .fundDetailsById
                                              .first
                                              .fundRaise
                                              .fundRequired
                                              .toDouble(),
                                  width: w - w * 0.05 - w * 0.03,
                                ),

                                //space from top
                                SizedBox(height: w * 0.04),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        //text
                                        AppFonts.textInter(
                                          context,
                                          //rupee  ,
                                          fundApi.gettingFundDetails.value
                                              ? '1519'
                                              : fundApi
                                                  .fundDetailsById
                                                  .first
                                                  .fundRaise
                                                  .supporterCount
                                                  .toString(),
                                          w * 0.055,
                                          FontWeight.w400,
                                          AppColors.blackFontColor.withOpacity(
                                            0.7,
                                          ),
                                          TextAlign.start,
                                          TextOverflow.visible,
                                        ),

                                        //text
                                        AppFonts.textInter(
                                          context,
                                          ' supporters',
                                          w * 0.035,
                                          FontWeight.w400,
                                          AppColors.shadowColor.withOpacity(
                                            0.4,
                                          ),
                                          TextAlign.start,
                                          TextOverflow.visible,
                                        ),
                                      ],
                                    ),

                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        //text
                                        AppFonts.textInter(
                                          context,
                                          //rupee  ,
                                          fundApi.gettingFundDetails.value
                                              ? '28'
                                              : fundApi
                                                  .fundDetailsById
                                                  .first
                                                  .fundRaise
                                                  .remainingDays
                                                  .toString(),
                                          w * 0.055,
                                          FontWeight.w400,
                                          AppColors.blackFontColor.withOpacity(
                                            0.7,
                                          ),
                                          TextAlign.start,
                                          TextOverflow.visible,
                                        ),

                                        //text
                                        AppFonts.textInter(
                                          context,
                                          ' Days left',
                                          w * 0.035,
                                          FontWeight.w400,
                                          AppColors.shadowColor.withOpacity(
                                            0.4,
                                          ),
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
                    ),
                  ),

                  //space from top
                  SizedBox(height: w * 0.04),

                  //row with 2 buttons
                  Obx(
                    () => Skeletonizer(
                      enabled: fundApi.gettingFundDetails.value,
                      child: Row(
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
                    ),
                  ),

                  //space from top
                  SizedBox(height: w * 0.07),

                  //supporters container
                  Obx(
                    () => Skeletonizer(
                      enabled: fundApi.gettingFundDetails.value,
                      child: IntrinsicHeight(
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
                                      fundApi.gettingFundDetails.value
                                          ? ' 100 Supporters'
                                          : ' ${fundApi.fundDetailsById.first.contributions.length} Supporters',
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

                                // //Row with most generous and rescent text and a vertical line in between
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceAround,
                                //   children: [
                                //     //most generous text
                                //     SizedBox(
                                //       width: w / 2.5,
                                //       child: Center(
                                //         child: AppFonts.textInter(
                                //           context,
                                //           'Most Generous',
                                //           w * 0.042,
                                //           FontWeight.w600,
                                //           AppColors.primaryColor,
                                //           TextAlign.start,
                                //           TextOverflow.visible,
                                //         ),
                                //       ),
                                //     ),

                                //     //vertical line
                                //     Container(
                                //       height: w * 0.075,
                                //       width: 2,
                                //       color: Colors.grey.shade200,
                                //     ),

                                //     //rescent text
                                //     SizedBox(
                                //       width: w / 2.5,
                                //       child: Center(
                                //         child: AppFonts.textInter(
                                //           context,
                                //           'Rescent',
                                //           w * 0.042,
                                //           FontWeight.w600,
                                //           AppColors.blackFontColor.withOpacity(
                                //             0.7,
                                //           ),
                                //           TextAlign.start,
                                //           TextOverflow.visible,
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),

                                //space from top
                                SizedBox(height: w * 0.02),

                                if (!fundApi.gettingFundDetails.value &&
                                    fundApi
                                        .fundDetailsById
                                        .first
                                        .contributions
                                        .isNotEmpty)
                                  //listview builder for supporters
                                  SizedBox(
                                    height:
                                        fundDetailController.isShowMore.value
                                            ? (w * 0.065 + w * 0.02) *
                                                fundApi
                                                    .fundDetailsById
                                                    .first
                                                    .contributions
                                                    .length
                                            : w * 0.3,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          fundDetailController.isShowMore.value
                                              ? NeverScrollableScrollPhysics()
                                              : NeverScrollableScrollPhysics(),
                                      itemCount:
                                          fundApi.gettingFundDetails.value
                                              ? fundDetailController
                                                      .isShowMore
                                                      .value
                                                  ? 10
                                                  : 3
                                              : fundDetailController
                                                  .isShowMore
                                                  .value
                                              ? fundApi
                                                  .fundDetailsById
                                                  .first
                                                  .contributions
                                                  .length
                                              : fundApi
                                                      .fundDetailsById
                                                      .first
                                                      .contributions
                                                      .length >
                                                  3
                                              ? 3
                                              : fundApi
                                                  .fundDetailsById
                                                  .first
                                                  .contributions
                                                  .length,
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
                                                    clipBehavior: Clip.hardEdge,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: CustomImage.CustImage(
                                                      fundApi
                                                              .gettingFundDetails
                                                              .value
                                                          ? ""
                                                          : fundApi
                                                                  .fundDetailsById
                                                                  .first
                                                                  .contributions[index]
                                                                  .userId ==
                                                              null
                                                          ? ""
                                                          : fundApi
                                                              .fundDetailsById
                                                              .first
                                                              .contributions[index]
                                                              .userId!
                                                              .userImage,
                                                      w * 0.065,
                                                      w * 0.065,
                                                      BoxFit.cover,
                                                    ),
                                                  ),

                                                  //space from left
                                                  SizedBox(width: w * 0.020),

                                                  //name
                                                  AppFonts.textInter(
                                                    context,
                                                    fundApi
                                                            .gettingFundDetails
                                                            .value
                                                        ? 'Priya Sharma'
                                                        : fundApi
                                                                .fundDetailsById
                                                                .first
                                                                .contributions[index]
                                                                .userId ==
                                                            null
                                                        ? ""
                                                        : fundApi
                                                            .fundDetailsById
                                                            .first
                                                            .contributions[index]
                                                            .userId!
                                                            .name,
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
                                                fundApi.gettingFundDetails.value
                                                    ? '\$ 45000'
                                                    : "₹ ${fundApi.fundDetailsById.first.contributions[index].donationAmount.toString()}",
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
                  ),

                  // space from bottom
                  SizedBox(height: w * 0.07),

                  //top contribution container
                  Obx(
                    () => Skeletonizer(
                      enabled: fundApi.gettingFundDetails.value,
                      child: IntrinsicHeight(
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
                                if (!fundApi.gettingFundDetails.value &&
                                    fundApi
                                        .fundDetailsById
                                        .first
                                        .contributions
                                        .isNotEmpty)
                                  //listview builder for supporters
                                  SizedBox(
                                    height:
                                        fundDetailController
                                                .isShowTopContr
                                                .value
                                            ? (w * 0.065 + w * 0.02) *
                                                fundApi
                                                    .fundDetailsById
                                                    .first
                                                    .topContribution
                                                    .length
                                            : w * 0.3,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          fundApi.gettingFundDetails.value
                                              ? fundDetailController
                                                      .isShowTopContr
                                                      .value
                                                  ? 10
                                                  : 3
                                              : fundDetailController
                                                  .isShowTopContr
                                                  .value
                                              ? fundApi
                                                  .fundDetailsById
                                                  .first
                                                  .topContribution
                                                  .length
                                              : fundApi
                                                      .fundDetailsById
                                                      .first
                                                      .topContribution
                                                      .length >
                                                  3
                                              ? 3
                                              : fundApi
                                                  .fundDetailsById
                                                  .first
                                                  .topContribution
                                                  .length,
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
                                                    clipBehavior: Clip.hardEdge,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: CustomImage.CustImage(
                                                      fundApi
                                                              .gettingFundDetails
                                                              .value
                                                          ? ""
                                                          : fundApi
                                                                  .fundDetailsById
                                                                  .first
                                                                  .topContribution[index]
                                                                  .userId ==
                                                              null
                                                          ? ""
                                                          : fundApi
                                                              .fundDetailsById
                                                              .first
                                                              .topContribution[index]
                                                              .userId!
                                                              .userImage,
                                                      w * 0.065,
                                                      w * 0.065,
                                                      BoxFit.cover,
                                                    ),
                                                  ),

                                                  //space from left
                                                  SizedBox(width: w * 0.020),

                                                  //name
                                                  AppFonts.textInter(
                                                    context,
                                                    fundApi
                                                            .gettingFundDetails
                                                            .value
                                                        ? 'Priya Sharma'
                                                        : fundApi
                                                                .fundDetailsById
                                                                .first
                                                                .topContribution[index]
                                                                .userId ==
                                                            null
                                                        ? ""
                                                        : fundApi
                                                            .fundDetailsById
                                                            .first
                                                            .topContribution[index]
                                                            .userId!
                                                            .name,
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
                                                fundApi.gettingFundDetails.value
                                                    ? '\$ 45000'
                                                    : "₹ ${fundApi.fundDetailsById.first.topContribution[index].donationAmount.toString()}",
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
                                        fundDetailController
                                                .isShowTopContr
                                                .value
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
                                        fundDetailController
                                                .isShowTopContr
                                                .value
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
                    fontSize: w * .034,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: [
                    Tab(text: "Overview"),
                    Tab(
                      text:
                          "Documents (${fundApi.gettingFundDetails.value ? 3 : fundApi.fundDetailsById.first.fundRaise.documents.length})",
                    ),
                    Tab(
                      text:
                          "Comments (${fundApi.gettingFundDetails.value ? 3 : fundApi.fundDetailsById.first.comments.length})",
                    ),
                  ],
                ),
              ),
            ),

            Obx(() {
              // Get the screen width once
              final w = MediaQuery.of(context).size.width;

              // Handle loading state or empty fundDetails
              if (fundApi.gettingFundDetails.value) {
                return _buildLoadingState(w);
              }

              if (fundApi.fundDetailsById.isEmpty) {
                return Center(
                  child: Text(
                    'No fund details available',
                    style: TextStyle(fontSize: w * 0.04),
                  ),
                );
              }

              final fundDetail = fundApi.fundDetailsById.first;

              return SizedBox(
                height: (w * 1.290 + w * .020),
                child: TabBarView(
                  controller: tabController,
                  children: [
                    // Tab 1: Overview
                    _buildOverviewTab(w, fundDetail),

                    // Tab 2: Documents
                    _buildDocumentsTab(w, fundDetail),

                    // Tab 3: Comments
                    _buildCommentsTab(w, fundDetail),
                  ],
                ),
              );
            }),

            //space from bottom
            SizedBox(height: w * 0.07),
          ],
        ),
      ),
    );
  }

  String formatTimeAgo(String isoDateString) {
    try {
      final dateTime = DateTime.parse(isoDateString);
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      // Future dates
      if (difference.isNegative) {
        final futureDifference = dateTime.difference(now);

        if (futureDifference.inDays > 365) {
          return DateFormat('dd MMMM yyyy').format(dateTime); // "12 June 2025"
        } else if (futureDifference.inDays >= 30) {
          final months = (futureDifference.inDays / 30).floor();
          return '$months month${months > 1 ? 's' : ''} later';
        } else if (futureDifference.inDays >= 1) {
          return '${futureDifference.inDays} day${futureDifference.inDays > 1 ? 's' : ''} later';
        } else if (futureDifference.inHours >= 1) {
          return '${futureDifference.inHours} hour${futureDifference.inHours > 1 ? 's' : ''} later';
        } else if (futureDifference.inMinutes >= 1) {
          return '${futureDifference.inMinutes} minute${futureDifference.inMinutes > 1 ? 's' : ''} later';
        } else {
          return 'Just now';
        }
      }
      // Past dates
      else {
        if (difference.inDays > 365) {
          return DateFormat('dd MMMM yyyy').format(dateTime); // "12 June 2025"
        } else if (difference.inDays >= 30) {
          final months = (difference.inDays / 30).floor();
          return '$months month${months > 1 ? 's' : ''} ago';
        } else if (difference.inDays >= 1) {
          return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
        } else if (difference.inHours >= 1) {
          return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
        } else if (difference.inMinutes >= 1) {
          return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
        } else {
          return 'Just now';
        }
      }
    } catch (e) {
      return 'Invalid date';
    }
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

  Widget _buildOverviewTab(double w, FundDetails fundDetail) {
    return SizedBox(
      height: (w * 1.290 + w * .020),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03, vertical: w * .040),
        child: SingleChildScrollView(
          child: RichText(
            text: TextSpan(
              text:
                  fundDetail.fundRaise?.writeYourStory?.isEmpty ?? true
                      ? "No Overview available..."
                      : fundDetail.fundRaise!.writeYourStory!,
              style: TextStyle(
                fontSize: w * 0.038,
                color: AppColors.shadowColor.withOpacity(0.5),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget for Documents tab
  Widget _buildDocumentsTab(double w, FundDetails fundDetail) {
    final documents = fundDetail.fundRaise?.documents ?? [];

    return SizedBox(
      height: (w * 1.290 + w * .020),
      child:
          documents.isEmpty
              ? Center(
                child: AppFonts.textInter(
                  context,
                  "No Documents Found..",
                  w * .030,
                  FontWeight.w500,
                  AppColors.blackFontColor,
                  TextAlign.center,
                  TextOverflow.ellipsis,
                ),
              )
              : ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: w * .040,
                      vertical: w * .020,
                    ),
                    child: Container(
                      height: w * 1.290,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w * .020),
                      ),
                      child: CustomImage.CustImage(
                        documents[index],
                        w,
                        w * 1.290,
                        BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
    );
  }

  // Helper widget for Comments tab
  Widget _buildCommentsTab(double w, FundDetails fundDetail) {
    final comments = fundDetail.comments ?? [];

    return SizedBox(
      height: (w * 1.290 + w * .020),
      child:
          comments.isEmpty
              ? Center(
                child: AppFonts.textInter(
                  context,
                  "No Comments yet..",
                  w * .030,
                  FontWeight.w500,
                  AppColors.blackFontColor,
                  TextAlign.center,
                  TextOverflow.ellipsis,
                ),
              )
              : ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: w * .040,
                      vertical: w * .020,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: w * .130,
                              width: w * .130,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: CustomImage.CustImage(
                                comment.userId?.userImage ?? "",
                                w * .130,
                                w * .130,
                                BoxFit.contain,
                              ),
                            ),
                            SizedBox(width: w * .020),
                            AppFonts.textInter(
                              context,
                              comment.userId?.name ?? "Unknown",
                              w * .040,
                              FontWeight.bold,
                              AppColors.blackFontColor,
                              TextAlign.center,
                              TextOverflow.ellipsis,
                            ),
                            SizedBox(width: w * .020),
                            AppFonts.textInter(
                              context,
                              formatTimeAgo(comment.createdAt.toString()),
                              w * .040,
                              FontWeight.bold,
                              AppColors.shadowColor.withOpacity(0.3),
                              TextAlign.center,
                              TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(height: w * .020),
                        AppFonts.textInter(
                          context,
                          comment.description ?? "",
                          w * .038,
                          FontWeight.w500,
                          AppColors.shadowColor.withOpacity(0.4),
                          TextAlign.start,
                          TextOverflow.visible,
                        ),
                      ],
                    ),
                  );
                },
              ),
    );
  }

  // Loading state widget
  Widget _buildLoadingState(double w) {
    return SizedBox(
      height: (w * 1.290 + w * .020),
      child: TabBarView(
        controller: tabController,
        children: [
          // Loading state for Overview tab
          Center(child: CircularProgressIndicator()),

          // Loading state for Documents tab
          ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .040,
                  vertical: w * .020,
                ),
                child: Container(height: w * 1.290, color: Colors.grey[200]),
              );
            },
          ),

          // Loading state for Comments tab
          ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .040,
                  vertical: w * .020,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: w * .065,
                          backgroundColor: Colors.grey[300],
                        ),
                        SizedBox(width: w * .020),
                        Container(
                          width: w * 0.4,
                          height: w * 0.04,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                    SizedBox(height: w * .020),
                    Container(
                      width: double.infinity,
                      height: w * 0.1,
                      color: Colors.grey[200],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
