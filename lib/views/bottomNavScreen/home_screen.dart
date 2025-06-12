import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:unno/apis/homePage.api.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/controller/bottomNav.controller.dart';
import 'package:unno/utils/CustomNetworkImage.dart';
import 'package:unno/utils/Custom_buttons.dart';
import 'package:unno/utils/RouteTransition.dart';
import 'package:unno/utils/custom_slide.dart';
import 'package:unno/utils/custom_text.dart';
import 'package:unno/views/homeRelated/notification_screen.dart';
import 'package:unno/views/homeRelated/viewAll_screen.dart';

import '../donationRelated/blood_bank_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BottomNavController bottomNavController = Get.find<BottomNavController>();
  HomePageApi homePageApi = Get.put(HomePageApi());
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

    //call home page data api
    homePageApi.getHomePageData();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteFontColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(w * .170),
        child: SafeArea(
          child: Container(
            color: AppColors.whiteFontColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * .040),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //profile with name row
                  Row(
                    children: [
                      Container(
                        height: w * .125,
                        width: w * .125,
                        decoration: BoxDecoration(
                          color: AppColors.whiteFontColor,
                          borderRadius: BorderRadius.circular(w * .170),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/profile.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //some space
                      SizedBox(width: w * .020),
                      //column with salutation and name
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppFonts.textInter(
                            context,
                            'Good Morning,',
                            w * .034,
                            FontWeight.w400,
                            AppColors.blackFontColor,
                            TextAlign.start,
                            TextOverflow.ellipsis,
                          ),
                          AppFonts.textInter(
                            context,
                            'Roshan Sharma',
                            w * .049,
                            FontWeight.w700,
                            AppColors.blackFontColor,
                            TextAlign.start,
                            TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),

                  //icons row of search, notification
                  Row(
                    children: [
                      //search icon
                      Icon(
                        Icons.search,
                        color: AppColors.blackFontColor,
                        size: w * .068,
                      ),
                      //some space
                      SizedBox(width: w * .040),
                      //notification icon
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            SlideLeftRoute(page: NotificationScreen()),
                          );
                        },
                        child: Icon(
                          Icons.notifications_none,
                          color: AppColors.blackFontColor,
                          size: w * .068,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 1,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //some space
              SizedBox(height: w * .020),

              //slider
              Obx(
                () =>
                    homePageApi.gettingHomeData.value
                        ? Skeletonizer(
                          enabled: true,
                          child: CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: false,
                              enlargeFactor: 0.8,
                              aspectRatio: 18 / 9,
                              viewportFraction: 1,
                            ),
                            items:
                                ["", ""].map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: w * .550,
                                        width: w,
                                        color: Colors.grey,
                                      );
                                    },
                                  );
                                }).toList(),
                          ),
                        )
                        : CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: false,
                            enlargeFactor: 0.8,
                            aspectRatio: 18 / 9,
                            viewportFraction: 1,
                          ),
                          items:
                              homePageApi.bannerData.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return CustomImage.CustImage(
                                      i.image,
                                      w,
                                      w * .550,
                                      BoxFit.contain,
                                    );
                                  },
                                );
                              }).toList(),
                        ),
              ),

              // //banner pic
              // Container(
              //   height: w * .550,
              //   width: w,
              //   decoration: BoxDecoration(
              //     color: AppColors.primaryColorLight,
              //     image: const DecorationImage(
              //       image: AssetImage('assets/images/home1.png'),
              //       fit: BoxFit.cover,
              //     ),
              //   ),

              //   child: Padding(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: w * .040,
              //       vertical: w * .040,
              //     ),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         //text on banner pic
              //         AppFonts.textInter(
              //           context,
              //           'donation',
              //           w * .084,
              //           FontWeight.w700,
              //           AppColors.whiteFontColor,
              //           TextAlign.start,
              //           TextOverflow.ellipsis,
              //         ),
              //         AppFonts.textInter(
              //           context,
              //           'FOR PEOPLE',
              //           w * .058,
              //           FontWeight.w700,
              //           AppColors.whiteFontColor,
              //           TextAlign.start,
              //           TextOverflow.ellipsis,
              //         ),

              //         //some space
              //         SizedBox(height: w * .020),

              //         //button on banner pic
              //         Container(
              //           height: w * .090,
              //           width: w * .360,
              //           decoration: BoxDecoration(
              //             color: AppColors.primaryColor,
              //             borderRadius: BorderRadius.circular(w * .020),
              //             boxShadow: [
              //               BoxShadow(
              //                 color: AppColors.whiteFontColor.withOpacity(.6),
              //                 blurRadius: w * .030,
              //                 spreadRadius: w * .001,
              //                 offset: const Offset(2, 5),
              //               ),
              //             ],
              //           ),
              //           child: Center(
              //             child: AppFonts.textInter(
              //               context,
              //               'Donate',
              //               w * .035,
              //               FontWeight.w700,
              //               AppColors.whiteFontColor,
              //               TextAlign.start,
              //               TextOverflow.ellipsis,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              //some space\
              SizedBox(height: w * .040),

              //text common widget
              _textViewAllCommonWidget(context, 'Trending Fundraisers', () {
                // Navigate to the view all screen
                Navigator.push(
                  context,
                  SlideLeftRoute(page: const ViewAllScreen()),
                );
              }),

              Obx(
                () => Skeletonizer(
                  enabled: homePageApi.gettingHomeData.value,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                    child: Row(
                      children: List.generate(
                        homePageApi.gettingHomeData.value
                            ? 3
                            : homePageApi.trendingFundRaisers.length,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * 0.03,
                            vertical: w * 0.04,
                          ),
                          child: _homePageCommonCard(
                            context,
                            homePageApi.gettingHomeData.value
                                ? 'assets/images/home2.png'
                                : homePageApi
                                    .trendingFundRaisers[index]
                                    .addFundraiserImageOrVideo
                                    .isEmpty
                                ? ""
                                : homePageApi
                                    .trendingFundRaisers[index]
                                    .addFundraiserImageOrVideo
                                    .first,
                            homePageApi.gettingHomeData.value
                                ? 'My Baby Battles For His Life...'
                                : homePageApi
                                    .trendingFundRaisers[index]
                                    .fundTitle,
                            homePageApi.gettingHomeData.value
                                ? 'by Mahendar Reddy Bakangari'
                                : "by ${homePageApi.trendingFundRaisers[index].userId.name}",
                            homePageApi.gettingHomeData.value
                                ? '47726'
                                : homePageApi
                                    .trendingFundRaisers[index]
                                    .totalDonationAmount
                                    .toString(), // Placeholder amount
                            homePageApi.gettingHomeData.value
                                ? '47726'
                                : homePageApi
                                    .trendingFundRaisers[index]
                                    .fundRequired
                                    .toString(), // Placeholder amount
                            homePageApi.gettingHomeData.value
                                ? '2479'
                                : homePageApi
                                    .trendingFundRaisers[index]
                                    .supporterCount
                                    .toString(),
                            homePageApi.gettingHomeData.value
                                ? '28'
                                : homePageApi
                                    .trendingFundRaisers[index]
                                    .remainingDays
                                    .toString(),
                            () {
                              // Handle donate
                            },
                            () {
                              // Handle share
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //some space
              SizedBox(height: w * .010),

              //text common widget
              _textViewAllCommonWidget(context, 'Top NGO,s', () {
                // Navigate to the trending screen
              }),

              Obx(
                () => Skeletonizer(
                  enabled: homePageApi.gettingHomeData.value,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                    child: Row(
                      children: List.generate(
                        homePageApi.gettingHomeData.value
                            ? 3
                            : homePageApi.topNgosList.length,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w * 0.03,
                              vertical: w * 0.04,
                            ),
                            child: _homePageCommonCard1(
                              context,
                              homePageApi.gettingHomeData.value
                                  ? 'assets/images/home3.png'
                                  : homePageApi.topNgosList[index].image,
                              homePageApi.gettingHomeData.value
                                  ? 'assets/images/home4.png'
                                  : homePageApi
                                      .topNgosList[index]
                                      .backGroundImage,
                              homePageApi.gettingHomeData.value
                                  ? 'NGO Name'
                                  : homePageApi.topNgosList[index].name,
                              homePageApi.gettingHomeData.value
                                  ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                                  : homePageApi.topNgosList[index].about,
                              true,
                              false,
                              "",
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),

              //some space\
              SizedBox(height: w * .030),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * .040),
                child: Container(
                  height: w * .300,
                  width: w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w * .020),
                    color: AppColors.primaryColor,
                  ),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: w * .030,
                          horizontal: w * .035,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppFonts.textInter(
                              context,
                              'Start Monthly Donation to \nSave Lives',
                              w * .040,
                              FontWeight.w700,
                              AppColors.whiteFontColor,
                              TextAlign.start,
                              TextOverflow.visible,
                            ),

                            SizedBox(
                              width: w * .340,
                              child: AppButtons.loginLike(
                                context,
                                () {},
                                AppFonts.textInter(
                                  context,
                                  'Donate',
                                  w * .034,
                                  FontWeight.w600,
                                  AppColors.primaryColor,
                                  TextAlign.start,
                                  TextOverflow.visible,
                                ),
                                AppColors.whiteFontColor,
                                false,
                                w * .090,
                                w * .015,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //image
                      Image.asset('assets/images/home5.png', height: w * .280),
                    ],
                  ),
                ),
              ),

              //some space\
              SizedBox(height: w * .060),

              //text common widget
              _textViewAllCommonWidget(context, 'Top Blood Bank', () {
                // Navigate to the trending screen
              }),

              //  Navigator.push(
              //       context,
              //       SlideLeftRoute(page: BloodBankDetail()),
              //     );
              Obx(
                () => Skeletonizer(
                  enabled: homePageApi.gettingHomeData.value,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                    child: Row(
                      children: List.generate(
                        homePageApi.gettingHomeData.value
                            ? 3
                            : homePageApi.topBloodBanks.length,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w * .030,
                              vertical: w * .040,
                            ),
                            child: _homePageCommonCard1(
                              context,
                              homePageApi.gettingHomeData.value
                                  ? 'assets/images/home7.png'
                                  : homePageApi.topBloodBanks[index].image,
                              homePageApi.gettingHomeData.value
                                  ? 'assets/images/home8.png'
                                  : homePageApi
                                      .topBloodBanks[index]
                                      .backGroundImage,
                              homePageApi.gettingHomeData.value
                                  ? 'Blood Bank Name'
                                  : homePageApi.topBloodBanks[index].name,
                              homePageApi.gettingHomeData.value
                                  ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                                  : homePageApi.topBloodBanks[index].address,
                              true,
                              false,
                              "",
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),

              //some space\
              SizedBox(height: w * .040),

              //text common widget
              _textViewAllCommonWidget(context, 'Latest Donation', () {
                // Navigate to the trending screen
              }),
              SizedBox(
                height: w * .750,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: w * .010),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * .030,
                        vertical: w * .040,
                      ),
                      child: _homePageCommonCard1(
                        context,
                        'assets/images/home8.png',
                        '',
                        'Mr. Rahul Singh',
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius enim in eros elementum tristique.  ',
                        false,
                        false,
                        "",
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: w * .040),

              //text common widget
              _textViewAllCommonWidget(context, 'Latest Missing & Found', () {
                // Navigate to the trending screen
              }),
              SizedBox(height: w * .010),
              SizedBox(
                height: w * .700,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: w * .010),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * .030,
                        vertical: w * .040,
                      ),
                      child: _homePageCommonCard1(
                        context,
                        'assets/images/home9.png',
                        '',
                        index == 1 ? "Found a Wallet" : 'Wallet Missing',
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                        false,
                        true,
                        index == 1 ? "Found" : "Missing",
                      ),
                    );
                  },
                ),
              ),

              //some space
              SizedBox(height: w * .040),

              //color box
              IntrinsicHeight(
                child: Container(
                  width: w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColorLight1,
                  ),

                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: w * .040,
                      vertical: w * .080,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // button like container with 110 height and w width with center text
                        Container(
                          height: w * .110,
                          width: w,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(w * .020),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadowColor,
                                blurRadius: w * .030,
                                spreadRadius: w * .001,
                                offset: const Offset(2, 5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: AppFonts.textInter(
                              context,
                              'Causes you can raise funds for',
                              w * .040,
                              FontWeight.w700,
                              AppColors.whiteFontColor,
                              TextAlign.start,
                              TextOverflow.visible,
                            ),
                          ),
                        ),

                        //space
                        SizedBox(height: w * .040),

                        //text on color box
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * .050),
                          child: AppFonts.textInter(
                            context,
                            'Be it for a personal need, social cause or a creative idea - you can count on us for the project that you want to raise funds for.',
                            w * .030,
                            FontWeight.w700,
                            AppColors.blackFontColor.withOpacity(.5),
                            TextAlign.center,
                            TextOverflow.visible,
                          ),
                        ),

                        //space
                        SizedBox(height: w * .020),

                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: w * .020,
                          runSpacing: w * .020,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            homePageCommonCard2(
                              context,
                              'assets/icons/education.png',
                              'Education',
                            ),
                            homePageCommonCard2(
                              context,
                              'assets/icons/medical.png',
                              'Medical',
                            ),
                            homePageCommonCard2(
                              context,
                              'assets/icons/nonProfit.png',
                              'Non-profit',
                            ),
                            homePageCommonCard2(
                              context,
                              'assets/icons/Memorials.png',
                              'Memorials',
                            ),
                            homePageCommonCard2(
                              context,
                              'assets/icons/more.png',
                              'Other\'s',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //some space
              SizedBox(height: w * .070),

              //center text of Success Stories
              Align(
                alignment: Alignment.center,
                child: AppFonts.textInter(
                  context,
                  'Success Stories',
                  w * .055,
                  FontWeight.w700,
                  AppColors.blackFontColor,
                  TextAlign.center,
                  TextOverflow.visible,
                ),
              ),
              //some space
              SizedBox(height: w * .070),

              //slider
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  aspectRatio: 20 / 10,
                  viewportFraction: 0.58,
                ),
                items:
                    [
                      "assets/images/home10.png",
                      "assets/images/home10.png",
                      "assets/images/home10.png",
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: w * .900,
                            height: w * .300,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w * .050),
                              image: DecorationImage(
                                image: AssetImage(i),
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
              ),

              //some space
              SizedBox(height: w * .020),

              //text after slider which can also change with animation
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    AppFonts.textInter(
                      context,
                      'Rahul pal',
                      w * .050,
                      FontWeight.w600,
                      AppColors.blackFontColor,
                      TextAlign.center,
                      TextOverflow.visible,
                    ),

                    // a primary color linethin line
                    SizedBox(height: w * .010),
                    Container(
                      width: w * .160,
                      height: w * .005,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(w * .050),
                      ),
                    ),

                    SizedBox(height: w * .010),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/icons/Group.png',
                              height: w * .050,
                              width: w * .050,
                            ),

                            //some space
                            SizedBox(width: w * .010),

                            SizedBox(
                              width: w * .550,
                              child: AppFonts.textInter(
                                context,
                                'Unoo give me chance to live my life happily.',
                                w * .048,
                                FontWeight.w500,
                                AppColors.blackFontColor.withOpacity(.7),
                                TextAlign.center,
                                TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: w * .010),

                        Image.asset(
                          'assets/icons/Group1.png',
                          height: w * .050,
                          width: w * .050,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //some space
              SizedBox(height: w * .090),

              //container
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * .040),
                child: IntrinsicHeight(
                  child: Container(
                    width: w,
                    decoration: BoxDecoration(
                      color: AppColors.whiteFontColor,
                      borderRadius: BorderRadius.circular(w * .020),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          blurRadius: w * .010,
                          spreadRadius: w * .001,
                        ),
                      ],
                    ),

                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * .040,
                        vertical: w * .040,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //text
                          Align(
                            alignment: Alignment.centerLeft,
                            child: AppFonts.textInter(
                              context,
                              'Featured In',
                              w * .049,
                              FontWeight.w700,
                              AppColors.blackFontColor,
                              TextAlign.start,
                              TextOverflow.visible,
                            ),
                          ),

                          //some space
                          SizedBox(height: w * .040),

                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: w * .060,
                            runSpacing: w * .060,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              IntrinsicWidth(
                                child: Container(
                                  height: w * .130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      w * .010,
                                    ),
                                    color: AppColors.primaryColor,
                                  ),

                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: w * .040,
                                      vertical: w * .020,
                                    ),
                                    child: Image.asset(
                                      'assets/icons/Logo.png',
                                      width: w * .300,
                                    ),
                                  ),
                                ),
                              ),
                              IntrinsicWidth(
                                child: Container(
                                  height: w * .130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      w * .010,
                                    ),
                                    color: AppColors.primaryColor,
                                  ),

                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: w * .040,
                                      vertical: w * .020,
                                    ),
                                    child: Image.asset(
                                      'assets/icons/Logo (1).png',
                                      width: w * .300,
                                    ),
                                  ),
                                ),
                              ),
                              IntrinsicWidth(
                                child: Container(
                                  height: w * .130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      w * .010,
                                    ),
                                    color: AppColors.primaryColor,
                                  ),

                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: w * .040,
                                      vertical: w * .020,
                                    ),
                                    child: Image.asset(
                                      'assets/icons/Logo (2).png',
                                      width: w * .300,
                                    ),
                                  ),
                                ),
                              ),
                              IntrinsicWidth(
                                child: Container(
                                  height: w * .130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      w * .010,
                                    ),
                                    color: AppColors.primaryColor,
                                  ),

                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: w * .040,
                                      vertical: w * .020,
                                    ),
                                    child: Image.asset(
                                      'assets/icons/Logo (3).png',
                                      width: w * .300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //some space
              SizedBox(height: w * .060),

              //container with date
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * .040),
                child: Container(
                  width: w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(w * .008),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: w * .060,
                      vertical: w * .060,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // column have two text one is date and onother is month like APR in column
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppFonts.textInter(
                                  context,
                                  '13',
                                  w * .066,
                                  FontWeight.w600,
                                  AppColors.whiteFontColor,
                                  TextAlign.start,
                                  TextOverflow.visible,
                                ),
                                AppFonts.textInter(
                                  context,
                                  'APR',
                                  w * .028,
                                  FontWeight.w500,
                                  AppColors.whiteFontColor,
                                  TextAlign.start,
                                  TextOverflow.visible,
                                ),
                              ],
                            ),

                            //some space
                            SizedBox(width: w * .040),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // row of text NEXT EVENT and a straight thin horizontal line of white color
                                Row(
                                  children: [
                                    AppFonts.textInter(
                                      context,
                                      'Next Event',
                                      w * .030,
                                      FontWeight.w600,
                                      AppColors.whiteFontColor,
                                      TextAlign.start,
                                      TextOverflow.visible,
                                    ),

                                    //space
                                    SizedBox(width: w * .040),

                                    // thin horizontal line
                                    Container(
                                      width: w * .08,
                                      height: w * .004,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteFontColor,
                                        borderRadius: BorderRadius.circular(
                                          w * .050,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                // text
                                AppFonts.textInter(
                                  context,
                                  'A day with our wonderful \nchildren ',
                                  w * .038,
                                  FontWeight.w700,
                                  AppColors.whiteFontColor,
                                  TextAlign.start,
                                  TextOverflow.visible,
                                ),
                              ],
                            ),
                          ],
                        ),

                        // circle button with forward arrow icon of primary color and circle have white color
                        Container(
                          height: w * .090,
                          width: w * .090,
                          decoration: BoxDecoration(
                            color: AppColors.whiteFontColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadowColor,
                                blurRadius: w * .030,
                                spreadRadius: w * .001,
                                offset: const Offset(2, 5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: AppColors.primaryColor,
                              size: w * .050,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //some space\
              SizedBox(height: w * .50),
            ],
          );
        },
      ),
    );
  }

  //text view all common widget
  Widget _textViewAllCommonWidget(
    BuildContext context,
    String item,
    void Function() onTap,
  ) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * .040),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //text
          AppFonts.textInter(
            context,
            item,
            w * .050,
            FontWeight.w700,
            AppColors.blackFontColor,
            TextAlign.start,
            TextOverflow.ellipsis,
          ),

          //view all text
          InkWell(
            onTap: () {
              onTap();
            },
            child: AppFonts.textInter(
              context,
              'View All',
              w * .038,
              FontWeight.w500,
              AppColors.primaryColor,
              TextAlign.start,
              TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  //home page common card widget
  Widget _homePageCommonCard(
    BuildContext context,
    String image,
    String title,
    String name,
    String mrp,
    String totalMrp,
    String totalSupports,
    String daysLeft,
    void Function() onTapDonate,
    void Function() onTapShare,
  ) {
    double w = MediaQuery.of(context).size.width;
    return IntrinsicHeight(
      child: Container(
        width: w * .640,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.whiteFontColor,
          borderRadius: BorderRadius.circular(w * .030),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: w * .030,
              spreadRadius: w * .001,
              offset: const Offset(-4, 4),
            ),
          ],
        ),

        child: Column(
          children: [
            //image
            CustomImage.CustImage(image, w * .640, w * .300, BoxFit.cover),

            //column
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * .030,
                vertical: w * .020,
              ),
              child: Column(
                children: [
                  //title
                  AppFonts.textInter(
                    context,
                    title,
                    w * .034,
                    FontWeight.w600,
                    AppColors.blackFontColor,
                    TextAlign.start,
                    TextOverflow.visible,
                  ),

                  //space
                  SizedBox(height: w * .010),

                  // row  with name and MR
                  Row(
                    children: [
                      //container with circle shape at center a text
                      Container(
                        height: w * .060,
                        width: w * .060,
                        decoration: BoxDecoration(
                          color: AppColors.shadowColor.withOpacity(.04),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: AppFonts.textInter(
                            context,
                            "MR",
                            w * .020,
                            FontWeight.w700,
                            AppColors.blackFontColor,
                            TextAlign.start,
                            TextOverflow.visible,
                          ),
                        ),
                      ),

                      //slite space
                      SizedBox(width: w * .020),

                      //name
                      AppFonts.textInter(
                        context,
                        name,
                        w * .029,
                        FontWeight.w500,
                        AppColors.blackFontColor,
                        TextAlign.start,
                        TextOverflow.visible,
                      ),
                    ],
                  ),

                  //space
                  SizedBox(height: w * .020),

                  //row of text with mrp and total mrp
                  Row(
                    children: [
                      //mrp
                      AppFonts.textInter(
                        context,
                        "₹${mrp}",
                        w * .038,
                        FontWeight.w800,
                        AppColors.blackFontColor,
                        TextAlign.start,
                        TextOverflow.visible,
                      ),

                      //some space
                      SizedBox(width: w * .010),

                      //total mrp
                      AppFonts.textInter(
                        context,
                        "raised out of ₹$totalMrp",
                        w * .030,
                        FontWeight.w400,
                        AppColors.blackFontColor.withOpacity(.5),
                        TextAlign.start,
                        TextOverflow.visible,
                      ),
                    ],
                  ),

                  //space
                  SizedBox(height: w * .020),

                  //slide
                  CustomSlide.customSlideTransition(
                    context: context,
                    nowNumber: double.parse(mrp),
                    totalNumber: double.parse(totalMrp),
                    width: w * .640 - w * .030,
                  ),

                  //space
                  SizedBox(height: w * .020),

                  //row of total supports and days left
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //days left with clock icon
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: AppColors.blackFontColor,
                            size: w * .035,
                          ),

                          //some space
                          SizedBox(width: w * .010),

                          AppFonts.textInter(
                            context,
                            daysLeft,
                            w * .025,
                            FontWeight.w700,
                            AppColors.blackFontColor,
                            TextAlign.start,
                            TextOverflow.visible,
                          ),

                          //some space
                          SizedBox(width: w * .010),

                          //days left
                          AppFonts.textInter(
                            context,
                            "Days Left",
                            w * .025,
                            FontWeight.w400,
                            AppColors.blackFontColor.withOpacity(.8),
                            TextAlign.start,
                            TextOverflow.visible,
                          ),
                        ],
                      ),
                      //total supports with heart icon
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: w * .038,
                          ),

                          //some space
                          SizedBox(width: w * .010),

                          //total supports
                          AppFonts.textInter(
                            context,
                            totalSupports,
                            w * .025,
                            FontWeight.w700,
                            AppColors.blackFontColor,
                            TextAlign.start,
                            TextOverflow.visible,
                          ),

                          //some space
                          SizedBox(width: w * .010),

                          //supporters
                          AppFonts.textInter(
                            context,
                            "Supporters",
                            w * .025,
                            FontWeight.w400,
                            AppColors.blackFontColor.withOpacity(.8),
                            TextAlign.start,
                            TextOverflow.visible,
                          ),
                        ],
                      ),
                    ],
                  ),

                  //some space
                  SizedBox(height: w * .020),

                  //row of donate and share button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // share outline button
                      SizedBox(
                        width: w * .280,
                        child: AppButtons.loginLikeWithBorder(
                          context,
                          () {},
                          AppFonts.textInter(
                            context,
                            "Share",
                            w * .030,
                            FontWeight.w600,
                            AppColors.blackFontColor,
                            TextAlign.start,
                            TextOverflow.visible,
                          ),
                          AppColors.blackFontColor,
                          AppColors.whiteFontColor,
                          false,
                          w * .090,
                          w * .015,
                        ),
                      ),

                      //donate button
                      SizedBox(
                        width: w * .280,
                        child: AppButtons.loginLike(
                          context,
                          () {},
                          AppFonts.textInter(
                            context,
                            "Donate",
                            w * .030,
                            FontWeight.w600,
                            AppColors.whiteFontColor,
                            TextAlign.start,
                            TextOverflow.visible,
                          ),
                          AppColors.primaryColor,
                          false,
                          w * .090,
                          w * .015,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //home page common card1 widget
  Widget _homePageCommonCard1(
    BuildContext context,
    String image,
    String coverImage,
    String title,
    String description,
    bool showSocialMediaIcons,
    bool showMissingFound,
    String missingFoundText,
  ) {
    double w = MediaQuery.of(context).size.width;
    return IntrinsicHeight(
      child: Container(
        width: w * .640,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.whiteFontColor,
          borderRadius: BorderRadius.circular(w * .030),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: w * .020,
              spreadRadius: w * .001,
              offset: const Offset(-4, 4),
            ),
          ],
        ),

        child: Padding(
          padding: EdgeInsets.only(bottom: w * .040),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              SizedBox(
                height: coverImage.isEmpty ? w * .400 : w * .480,
                width: w * .640,
                child: Stack(
                  children: [
                    CustomImage.CustImage(
                      image,
                      w * .640,
                      w * .400,
                      BoxFit.contain,
                    ),

                    if (showMissingFound)
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: IntrinsicWidth(
                          child: Container(
                            height: w * .060,

                            decoration: BoxDecoration(
                              color:
                                  missingFoundText == "Missing"
                                      ? Colors.red
                                      : Colors.green,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(w * .020),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: w * .030,
                              ),
                              child: Center(
                                child: AppFonts.textInter(
                                  context,
                                  missingFoundText,
                                  w * .032,
                                  FontWeight.w600,
                                  AppColors.whiteFontColor,
                                  TextAlign.start,
                                  TextOverflow.visible,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (coverImage.isNotEmpty)
                      //icon
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * .030),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: w * .200,
                            width: w * .200,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shadowColor,
                                  blurRadius: w * .015,
                                  spreadRadius: w * .001,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(w * .200),
                              color: AppColors.whiteFontColor,
                            ),
                            child: CustomImage.CustImage(
                              coverImage,
                              w * .200,
                              w * .200,
                              BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * .030),
                    child: AppFonts.textInter(
                      context,
                      title,
                      coverImage.isEmpty ? w * .039 : w * .058,
                      FontWeight.w600,
                      AppColors.blackFontColor,
                      TextAlign.start,
                      TextOverflow.ellipsis,
                    ),
                  ),

                  //some space
                  SizedBox(height: w * .010),

                  //description
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * .030),
                    child: SizedBox(
                      height: w * .100,
                      child: AppFonts.textInter(
                        context,
                        description.length > 57
                            ? '${description.substring(0, 57)}...'
                            : description,
                        coverImage.isEmpty ? w * .028 : w * .038,
                        FontWeight.w500,
                        AppColors.blackFontColor.withOpacity(.5),
                        TextAlign.start,
                        TextOverflow.visible,
                      ),
                    ),
                  ),

                  if (showSocialMediaIcons)
                    // row of social media icons
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * .030,
                        vertical: w * .020,
                      ),
                      child: Row(
                        children: [
                          //facebook icon
                          Image.asset(
                            'assets/icons/fb.png',
                            height: w * .040,
                            width: w * .040,
                          ),

                          //some space
                          SizedBox(width: w * .030),

                          //twitter icon
                          Image.asset(
                            'assets/icons/twitter.png',
                            height: w * .040,
                            width: w * .040,
                          ),

                          //some space
                          SizedBox(width: w * .030),

                          //instagram icon
                          Image.asset(
                            'assets/icons/linkdin.png',
                            height: w * .040,
                            width: w * .040,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //home page common card2 widget
  Widget homePageCommonCard2(BuildContext context, String image, String title) {
    double w = MediaQuery.of(context).size.width;
    return IntrinsicHeight(
      child: Container(
        width: w * .290,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(w * .020),
          color: AppColors.whiteFontColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: w * .030,
              spreadRadius: w * .001,
              offset: const Offset(2, 5),
            ),
          ],
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w * .020,
            vertical: w * .035,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //image
              Container(
                height: w * .150,
                width: w * .150,
                decoration: BoxDecoration(
                  color: AppColors.whiteFontColor,
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //text
              AppFonts.textInter(
                context,
                title,
                w * .038,
                FontWeight.w700,
                AppColors.blackFontColor.withOpacity(.7),
                TextAlign.start,
                TextOverflow.visible,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
