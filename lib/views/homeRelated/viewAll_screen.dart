import 'package:flutter/material.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/utils/CustomBottomSheet.dart';
import 'package:unno/utils/CustomFormField.dart';
import 'package:unno/utils/Custom_buttons.dart';
import 'package:unno/utils/custom_slide.dart';
import 'package:unno/utils/custom_text.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({super.key});

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteFontColor,
      //appBar
      appBar: AppBar(
        backgroundColor: AppColors.whiteFontColor,
        title: AppFonts.textInter(
          context,
          "Fundraisers",
          w * .045,
          FontWeight.w600,
          AppColors.blackFontColor,
          TextAlign.start,
          TextOverflow.ellipsis,
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: AppColors.blackFontColor),

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(w * .15),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * .04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 9,
                  child: Container(
                    height: w * .13,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: AppColors.whiteFontColor,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          blurRadius: w * .015,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(w * .1),
                      border: Border.all(color: AppColors.shadowColor),
                    ),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 5,
                          child: CustomFormField.custTextFormSearch(
                            context,
                            "Search ..",
                            1,
                            1000,
                            null,
                            null,
                            TextInputType.text,
                            (val) {},
                            search,
                            (val) {
                              return null;
                            },
                            false,
                            (val) {},
                            () {},
                          ),
                        ),

                        Flexible(
                          flex: 1,
                          child: Container(
                            height: w * .14,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(w * .075),
                                bottomRight: Radius.circular(w * .059),
                                topRight: Radius.circular(w * .055),
                              ),
                              color: AppColors.primaryColor,
                            ),

                            child: Center(
                              child: Image.asset(
                                'assets/icons/search.png',
                                height: w * .05,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      // Handle filter button tap
                      Custombottomsheet.showCustomBottomSheet(context: context);
                    },
                    child: Image.asset(
                      "assets/icons/filter.png",
                      width: w * .08,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // body
      body: ListView.builder(
        itemCount: 1,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: w * .060),
        itemBuilder: (context, index) {
          return Wrap(
            spacing: w * .04,
            runSpacing: w * .04,
            alignment: WrapAlignment.center,
            children: List.generate(
              10,
              (index) => SizedBox(
                height: w * .720,
                child: _viewAllCommonCard(
                  context,
                  'assets/images/home2.png',
                  'My Baby Battles For His Life And We Need Your Support To Save…',
                  'by Mahendar Reddy Bakangari',
                  '\$47,726',
                  '\$64,705',
                  '2479',
                  '28',
                  () {
                    // Handle donate button tap
                  },
                  () {
                    // Handle share button tap
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // common card for viewAll
  Widget _viewAllCommonCard(
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
        width: w * .440,
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
            Container(
              height: w * .250,
              width: w * .640,
              decoration: BoxDecoration(
                color: AppColors.whiteFontColor,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //column
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * .020,
                vertical: w * .020,
              ),
              child: Column(
                children: [
                  //title
                  AppFonts.textInter(
                    context,
                    title,
                    w * .022,
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
                        height: w * .040,
                        width: w * .040,
                        decoration: BoxDecoration(
                          color: AppColors.shadowColor.withOpacity(.04),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: AppFonts.textInter(
                            context,
                            "MR",
                            w * .015,
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
                        w * .019,
                        FontWeight.w500,
                        AppColors.blackFontColor,
                        TextAlign.start,
                        TextOverflow.visible,
                      ),
                    ],
                  ),

                  //space
                  SizedBox(height: w * .010),

                  //row of text with mrp and total mrp
                  Row(
                    children: [
                      //mrp
                      AppFonts.textInter(
                        context,
                        mrp,
                        w * .025,
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
                        "raised out of $totalMrp",
                        w * .023,
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
                    nowNumber: 47726,
                    totalNumber: 64705,
                    width: w * .440 - w * .030,
                  ),

                  //space
                  SizedBox(height: w * .020),

                  //row of total supports and days left
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //days left with clock icon
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.access_time,
                            color: AppColors.blackFontColor,
                            size: w * .025,
                          ),

                          //some space
                          SizedBox(width: w * .010),

                          AppFonts.textInter(
                            context,
                            daysLeft,
                            w * .020,
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
                            w * .020,
                            FontWeight.w400,
                            AppColors.blackFontColor.withOpacity(.8),
                            TextAlign.start,
                            TextOverflow.visible,
                          ),
                        ],
                      ),
                      //total supports with heart icon
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: w * .022,
                          ),

                          //total supports
                          AppFonts.textInter(
                            context,
                            " $totalSupports",
                            w * .020,
                            FontWeight.w700,
                            AppColors.blackFontColor,
                            TextAlign.start,
                            TextOverflow.visible,
                          ),

                          //supporters
                          AppFonts.textInter(
                            context,
                            " Supporters",
                            w * .020,
                            FontWeight.w400,
                            AppColors.blackFontColor.withOpacity(.8),
                            TextAlign.start,
                            TextOverflow.visible,
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Share outline button - expanded to fill half the space
                  AppButtons.loginLikeWithBorder(
                    context,
                    onTapShare,
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
                    w * .070,
                    w * .015,
                  ),

                  Container(
                    height: w * .070,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(w * .015),
                    ),
                    child: Center(
                      child: AppFonts.textInter(
                        context,
                        "Donate",
                        w * .030,
                        FontWeight.w600,
                        AppColors.whiteFontColor,
                        TextAlign.start,
                        TextOverflow.visible,
                      ),
                    ),
                  ),

                  // // Donate button - expanded to fill half the space
                  // AppButtons.loginLike(
                  //   context,
                  //   onTapDonate,
                  //   AppFonts.textInter(
                  //     context,
                  //     "Donate",
                  //     w * .030,
                  //     FontWeight.w600,
                  //     AppColors.whiteFontColor,
                  //     TextAlign.start,
                  //     TextOverflow.visible,
                  //   ),
                  //   AppColors.primaryColor,
                  //   false,
                  //   w * .070,
                  //   w * .015,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
