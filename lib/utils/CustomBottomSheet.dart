import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/controller/bottomSheet.controller.dart';
import 'package:unno/utils/Custom_buttons.dart';
import 'package:unno/utils/custom_text.dart';

class Custombottomsheet {
  //fundraisers filter bottom sheet
  static void showCustomBottomSheet({required BuildContext context}) {
    double w = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.whiteFontColor,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DefaultTabController(
            length: 2,
            child: Container(
              padding: EdgeInsets.all(w * 0.04),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header line in center horizontally
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: w * .015,
                      width: w * .15,
                      decoration: BoxDecoration(
                        color: AppColors.shadowColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  //some space
                  SizedBox(height: w * 0.06),

                  // Tab Bar
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: AppColors.whiteFontColor,
                      border: Border.all(color: AppColors.shadowColor),
                      borderRadius: BorderRadius.circular(w * .090),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(color: AppColors.primaryColor),
                      labelColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: Colors.black,
                      dividerHeight: 0.0,
                      labelStyle: TextStyle(
                        fontSize: w * .040,
                        fontWeight: FontWeight.w600,
                      ),
                      tabs: [
                        Tab(text: "Fundraisers for"),
                        Tab(text: "Location"),
                      ],
                    ),
                  ),

                  SizedBox(height: w * .040),

                  // Flexible TabBarView that takes remaining space
                  SizedBox(
                    height: w * .90,
                    child: TabBarView(
                      children: [
                        _buildCheckboxList(w, context),
                        Center(child: Text('Location Tab Content')),
                      ],
                    ),
                  ),

                  // Show Button using your AppButtons.loginLike
                  Padding(
                    padding: EdgeInsets.only(top: w * 0.04),
                    child: AppButtons.loginLike(
                      context,
                      () {
                        // Show button logic
                      },
                      AppFonts.textInter(
                        context,
                        "Show",
                        w * .046,
                        FontWeight.w600,
                        AppColors.whiteFontColor,
                        TextAlign.center,
                        TextOverflow.ellipsis,
                      ),
                      AppColors.primaryColor,
                      false,
                      w * .130,
                      w * .020,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _buildCheckboxList(double w, BuildContext context) {
    BottomSheetController bottomSheetController = Get.put(
      BottomSheetController(),
    );
    final List<String> categories = [
      "All categories",
      "Trending Fundraisers",
      "Top NGO,s",
      "Top Blood Bank",
      "Latest  Donation",
      "Latest Missing & Found",
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header text
          AppFonts.textInter(
            context,
            "Fundraisers for",
            w * .050,
            FontWeight.w600,
            AppColors.blackFontColor,
            TextAlign.start,
            TextOverflow.ellipsis,
          ),
          SizedBox(height: w * .04),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: w * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: AppFonts.textInter(
                        context,
                        categories[index],
                        w * .040,
                        FontWeight.w500,
                        AppColors.blackFontColor.withOpacity(0.5),
                        TextAlign.start,
                        TextOverflow.ellipsis,
                      ),
                    ),

                    Obx(
                      () => Transform.scale(
                        scale: w * .0035,
                        child: Checkbox(
                          checkColor: AppColors.whiteFontColor,
                          activeColor: AppColors.primaryColor,

                          side: BorderSide(
                            color: AppColors.shadowColor,
                            width: w * .0015,
                          ),
                          value:
                              bottomSheetController.selectedFundraiser.value ==
                              index,
                          onChanged: (val) {
                            bottomSheetController.selectedFundraiser.value =
                                index;
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
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

  //select gender bottomSheet
  static Future<void> genderBottomSheet(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    BottomSheetController bottomSheetController = Get.put(
      BottomSheetController(),
    );

    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: h * .270,
          width: w,
          clipBehavior: Clip.hardEdge, // Ensure clipping happens
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                w * .02,
              ), // Increased radius value for better visibility
              topRight: Radius.circular(
                w * .02,
              ), // Increased radius value for better visibility
            ),
          ),
          child: Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: w * .040),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Add your content here (e.g., buttons, text, etc.)
                  AppFonts.textInter(
                    context,
                    "Select your gender",
                    w * .045,
                    FontWeight.w500,
                    Colors.black54,
                    TextAlign.start,
                    TextOverflow.ellipsis,
                  ),

                  SizedBox(height: h * .010),
                  InkWell(
                    onTap: () {
                      bottomSheetController.genNo.value = 0;
                      bottomSheetController.gender.value = "Male";
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: h * .050,
                      width: w,
                      decoration: BoxDecoration(
                        color:
                            bottomSheetController.genNo.value == 0
                                ? AppColors.primaryColorLight1
                                : Colors.white,
                        borderRadius: BorderRadius.circular(w * .012),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * .040),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppFonts.textInter(
                              context,
                              "Male",
                              w * .040,
                              FontWeight.w500,
                              Colors.black54,
                              TextAlign.start,
                              TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Divider(color: Colors.grey.shade300),
                  InkWell(
                    onTap: () {
                      bottomSheetController.genNo.value = 1;
                      bottomSheetController.gender.value = "Female";
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: h * .050,
                      width: w,
                      decoration: BoxDecoration(
                        color:
                            bottomSheetController.genNo.value == 1
                                ? AppColors.primaryColorLight1
                                : Colors.white,
                        borderRadius: BorderRadius.circular(w * .012),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * .040),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppFonts.textInter(
                              context,
                              "Female",
                              w * .040,
                              FontWeight.w500,
                              Colors.black54,
                              TextAlign.start,
                              TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Divider(color: Colors.grey.shade300),

                  InkWell(
                    onTap: () {
                      bottomSheetController.genNo.value = 2;
                      bottomSheetController.gender.value = "Other";
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: h * .050,
                      width: w,
                      decoration: BoxDecoration(
                        color:
                            bottomSheetController.genNo.value == 2
                                ? AppColors.primaryColorLight1
                                : Colors.white,
                        borderRadius: BorderRadius.circular(w * .012),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * .040),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppFonts.textInter(
                              context,
                              "Other",
                              w * .040,
                              FontWeight.w500,
                              Colors.black54,
                              TextAlign.start,
                              TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
