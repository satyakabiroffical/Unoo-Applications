import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:image_picker/image_picker.dart';
import '../../appPreferences/appColors.dart';
import '../../utils/Custom_buttons.dart';
import '../../utils/RouteTransition.dart';
import '../../utils/custom_step1_widget.dart';
import '../../utils/custom_step2_widget.dart';
import '../../utils/custom_step3_widget.dart';
import '../../utils/custom_stepindicator.dart';

import '../form/personal_detail.dart';

class FormScreen1 extends StatefulWidget {
  const FormScreen1({super.key});

  @override
  State<FormScreen1> createState() => _FormScreen1State();
}

class _FormScreen1State extends State<FormScreen1> {
  File? _selectedImage;
  File? _finalImage;
  final ImagePicker _picker = ImagePicker();

  int _currentStep = 1;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteFontColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteFontColor,
        title: Text(
          "Fundraisers",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: w * .045,
            color: AppColors.blackFontColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: w * .05),
            StepIndicator(totalSteps: 3, currentStep: _currentStep, width: w),
            SizedBox(height: w * .05),

            // Show dynamic content based on current step
            if (_currentStep == 1)
              StepOne(
                w: w,
                onAmountChanged: (val) {
                  print("Amount changed: $val");
                  // Update your state or controller here
                },
                onTitleChanged: (val) {
                  print("Title changed: $val");
                  // Update your state or controller here
                },
                onFundForChanged: (val) {
                  print("Fund For changed: $val");
                  // Update your state or controller here
                },
                onEducationChanged: (val) {
                  print("Education changed: $val");
                  // Update your state or controller here
                },
                onEmploymentChanged: (val) {
                  print("Employment changed: $val");
                  // Update your state or controller here
                },
              ),

            if (_currentStep == 2) StepTwoWidget(w: w, parentContext: context),

            // if (_currentStep == 3) _buildStepThree(w),
            if (_currentStep == 3) StepThree(w: w),


            SizedBox(height: w * .04),

            // Save and Continue Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * .04),
              child: AppButtons.loginLike(
                context,
                    () {
                  if (_currentStep < 3) {
                    setState(() {
                      _currentStep++;
                    });
                  } else {
                    print("Submit button pressed");
                    // Navigator.push(context, SlideLeftRoute(page: PersonalDetail()));
                  }
                },
                Text(
                  _currentStep < 3 ? "Save and continue" : "Submit",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: w * .040,
                    color: AppColors.whiteFontColor,
                  ),
                ),
                AppColors.primaryColor,
                false,
                w * .130,
                w * .020,
              ),
            ),

            SizedBox(height: w * .04),
          ],
        ),
      ),

    );
  }

}