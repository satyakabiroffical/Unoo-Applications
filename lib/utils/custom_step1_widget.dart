import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_label_text.dart';
import 'custom_richtext.dart';
import 'custom_textfield.dart';

class StepOne extends StatelessWidget {
  final double w;
  final void Function(String) onAmountChanged;
  final void Function(String) onTitleChanged;
  final void Function(String) onFundForChanged;
  final void Function(String) onEducationChanged;
  final void Function(String) onEmploymentChanged;

  const StepOne({
    Key? key,
    required this.w,
    required this.onAmountChanged,
    required this.onTitleChanged,
    required this.onFundForChanged,
    required this.onEducationChanged,
    required this.onEmploymentChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: w * .01),
          FundRaisingTile(
            text: 'Other purpose ',
            icon: Icons.add,
            onTap: () {
              print('Tapped on Medical Treatment');
              // Add your logic here
            },
          ),
          SizedBox(height: w * .05),

          LabeledText(
            text: 'How much do you want to raise?',
            showAsterisk: true,
            textStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.033,
              color: const Color.fromRGBO(107, 114, 128, 1),
            ),
          ),
          SizedBox(height: w * .02),

          CustomTextField(
            initialValue: "50000",
            keyboardType: TextInputType.number,
            suffixIcon: Image.asset('assets/images/q.png', fit: BoxFit.contain),
            onChanged: onAmountChanged,
          ),

          SizedBox(height: w * .02),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Should be minimum ₹ 2000',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: w * .028,
                    color: Color.fromRGBO(107, 114, 128, 1),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: w * .05),

          LabeledText(
            text: 'Fundraise Title *',
            textStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.033,
              color: const Color.fromRGBO(107, 114, 128, 1),
            ),
          ),
          SizedBox(height: w * .02),

          CustomTextField(
            initialValue: "For my Education",
            keyboardType: TextInputType.text,
            suffixIcon: Icon(Icons.arrow_forward_ios_outlined, size: 19, color: Color.fromRGBO(156, 163, 175, 1)),
            onChanged: onTitleChanged,
          ),

          SizedBox(height: w * .05),

          LabeledText(
            text: 'Whom are you raising funds for? *',
            textStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.033,
              color: const Color.fromRGBO(107, 114, 128, 1),
            ),
          ),
          SizedBox(height: w * .02),

          CustomTextField(
            initialValue: "Grandfather",
            keyboardType: TextInputType.text,
            suffixIcon: Icon(Icons.arrow_forward_ios_outlined, size: 19, color: Color.fromRGBO(156, 163, 175, 1)),
            onChanged: onFundForChanged,
          ),

          SizedBox(height: w * .05),

          LabeledText(
            text: 'Your Education Qualification',
            textStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.033,
              color: const Color.fromRGBO(107, 114, 128, 1),
            ),
          ),
          SizedBox(height: w * .02),

          CustomTextField(
            initialValue: "Graduate",
            keyboardType: TextInputType.text,
            suffixIcon: Icon(Icons.arrow_forward_ios_outlined, size: 19, color: Color.fromRGBO(156, 163, 175, 1)),
            onChanged: onEducationChanged,
          ),

          SizedBox(height: w * .05),

          LabeledText(
            text: 'Your Employment Status',
            textStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.033,
              color: const Color.fromRGBO(107, 114, 128, 1),
            ),
          ),
          SizedBox(height: w * .02),

          CustomTextField(
            initialValue: "Self-employed",
            keyboardType: TextInputType.text,
            suffixIcon: Icon(Icons.arrow_forward_ios_outlined, size: 19, color: Color.fromRGBO(156, 163, 175, 1)),
            onChanged: onEmploymentChanged,
          ),

          SizedBox(height: w * .04),

          Center(
            child: Text(
              'You can easily make changes to your fundraiser at any time',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: w * .027,
                color: Color.fromRGBO(107, 114, 128, 1),
              ),
            ),
          ),

          SizedBox(height: w * .04),

          Container(
            padding: EdgeInsets.symmetric(horizontal: w * .03, vertical: w * .04),
            margin: EdgeInsets.symmetric(horizontal: w * .04),
            width: double.maxFinite,
            color: Color.fromRGBO(240, 253, 250, 1),
            child: Text(
              'Unoo s zero platform fee policy will ensure more funds for you.',
              style: GoogleFonts.inter(
                fontSize: w * .027,
                color: Color.fromRGBO(0, 181, 226, 1),
              ),
            ),
          ),

          SizedBox(height: w * .04),
        ],
      ),
    );
  }
}
