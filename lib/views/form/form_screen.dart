import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unno/views/form/personal_detail.dart';
import '../../appPreferences/appColors.dart';
import '../../utils/Custom_buttons.dart';

import '../../utils/custom_step_one_widget.dart';
import '../../utils/custom_step_three_widget.dart';
import '../../utils/custom_step_two_widget.dart';
import '../../utils/custom_stepindicator.dart' hide FundRaisingTile, CustomSelectableContainer;


class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
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
            // if (_currentStep == 1) _buildStepOne(w),
            if (_currentStep == 1) StepOneWidget(w: w),
            if (_currentStep == 2) StepTwoForm(w: w),
            if (_currentStep == 3) StepThreeForm(w: w),

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
                    // Submit action for step 3
                    print("Submit button pressed");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PersonalDetail()), // Replace with your actual screen
                    );
                    // Add your submit logic here
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
