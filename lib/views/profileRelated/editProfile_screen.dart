import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/controller/editProfile.controller.dart';
import 'package:unno/utils/CustomBottomSheet.dart' show Custombottomsheet;
import 'package:unno/utils/CustomFormField.dart';
import 'package:unno/utils/Custom_buttons.dart';
import 'package:unno/utils/custom_text.dart';

import '../../controller/bottomSheet.controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController panDetails = TextEditingController();
  TextEditingController dob = TextEditingController();
  BottomSheetController bottomSheetController = Get.put(
    BottomSheetController(),
  );
  EditProfileController editProfileController = Get.put(
    EditProfileController(),
  );

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteFontColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteFontColor,
        title: AppFonts.textInter(
          context,
          "Edit your profile",
          w * .045,
          FontWeight.w500,
          AppColors.blackFontColor,
          TextAlign.start,
          TextOverflow.ellipsis,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * .04, vertical: w * .05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: w * .21,
                  width: w * .21,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: w * .21,
                          width: w * .21,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      //edit icon
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: w * .07,
                          width: w * .07,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: Icon(
                            Icons.camera_enhance_outlined,
                            color: AppColors.whiteFontColor,
                            size: w * .05,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //size
              SizedBox(height: w * .02),

              //name
              Align(
                alignment: Alignment.center,
                child: AppFonts.textInter(
                  context,
                  "Roshan sharma",
                  w * .045,
                  FontWeight.w700,
                  AppColors.blackFontColor,
                  TextAlign.start,
                  TextOverflow.ellipsis,
                ),
              ),

              //space from top
              SizedBox(height: w * .04),

              textFieldCommonWidget(
                context,
                'Enter your name',
                nameController,
                TextInputType.text,
                'Full Name',
              ),
              SizedBox(height: w * .04),

              textFieldCommonWidget(
                context,
                'Enter your email',
                emailController,
                TextInputType.text,
                'Email',
              ),
              SizedBox(height: w * .04),

              textFieldCommonWidget(
                context,
                'Mobile number',
                phoneController,
                TextInputType.number,
                'Mobile Number',
              ),

              SizedBox(height: w * .04),

              textFieldCommonWidget(
                context,
                'Enter 10 digit PAN number',
                panDetails,
                TextInputType.text,
                'Pan details (for tax benefits)',
              ),

              // space from top
              SizedBox(height: w * .04),

              AppFonts.textInter(
                context,
                "Gender",
                w * .038,
                FontWeight.w600,
                AppColors.blackFontColor,
                TextAlign.start,
                TextOverflow.ellipsis,
              ),

              //space from top
              SizedBox(height: w * .020),

              //drop down button for gender
              InkWell(
                onTap: () {
                  Custombottomsheet.genderBottomSheet(context);
                },
                child: Container(
                  height: w * .130,
                  width: w,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.shadowColor),
                    borderRadius: BorderRadius.circular(w * .02),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * .04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => AppFonts.textInter(
                            context,
                            bottomSheetController.gender.value,
                            w * .038,
                            FontWeight.w500,
                            bottomSheetController.gender.value !=
                                    "Select Gender"
                                ? AppColors.blackFontColor
                                : AppColors.shadowColor.withOpacity(0.2),
                            TextAlign.start,
                            TextOverflow.ellipsis,
                          ),
                        ),

                        //icon
                        Icon(
                          CupertinoIcons.chevron_down,
                          color: AppColors.shadowColor.withOpacity(0.2),
                          size: w * .05,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // space from top
              SizedBox(height: w * .04),

              AppFonts.textInter(
                context,
                "Date of Birth",
                w * .038,
                FontWeight.w600,
                AppColors.blackFontColor,
                TextAlign.start,
                TextOverflow.ellipsis,
              ),

              //space from top
              SizedBox(height: w * .020),

              InkWell(
                onTap: () {
                  editProfileController.selectDate(context);
                },
                child: Container(
                  height: w * .130,
                  width: w,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.shadowColor),
                    borderRadius: BorderRadius.circular(w * .02),
                  ),

                  child: Obx(
                    () => Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * .04),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AppFonts.textInter(
                          context,
                          editProfileController.selectedDate1.value ==
                                  "DD/MM/YYYY"
                              ? "DD/MM/YYYY"
                              : editProfileController.selectedDate1.value,
                          w * .038,
                          FontWeight.w500,
                          editProfileController.selectedDate1.value ==
                                  "DD/MM/YYYY"
                              ? AppColors.shadowColor.withOpacity(0.2)
                              : AppColors.shadowColor.withOpacity(0.7),
                          TextAlign.start,
                          TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //space from top
              SizedBox(height: w * .06),

              //Row with text and text1
              Row(
                children: [
                  AppFonts.textInter(
                    context,
                    "Update password?",
                    w * .038,
                    FontWeight.w600,
                    AppColors.blackFontColor,
                    TextAlign.start,
                    TextOverflow.ellipsis,
                  ),
                  AppFonts.textInter(
                    context,
                    " Click here",
                    w * .038,
                    FontWeight.w600,
                    AppColors.primaryColor,
                    TextAlign.start,
                    TextOverflow.ellipsis,
                  ),
                ],
              ),

              //space from top
              SizedBox(height: w * .04),

              // save details button
              AppButtons.loginLike(
                context,
                () {},
                AppFonts.textInter(
                  context,
                  "Save Details",
                  w * .040,
                  FontWeight.w600,
                  AppColors.whiteFontColor,
                  TextAlign.start,
                  TextOverflow.ellipsis,
                ),
                AppColors.primaryColor,
                false,
                w * .130,
                w * .020,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //text field common widget
  Widget textFieldCommonWidget(
    BuildContext context,
    String hint,
    TextEditingController controller,
    TextInputType type,
    String label,
  ) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //text
        AppFonts.textInter(
          context,
          label,
          w * .038,
          FontWeight.w600,
          AppColors.blackFontColor,
          TextAlign.start,
          TextOverflow.ellipsis,
        ),

        //space from top
        SizedBox(height: w * .020),

        //text form field
        CustomFormField.custTextFormOther(
          context,
          hint,
          1,
          100,
          null,
          null,
          type,
          (val) {},
          controller,
          (val) {
            return null;
          },
          false,
          FocusNode(),
          false,
          (val) {},
          () {},
        ),
      ],
    );
  }
}
