import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_label_text.dart';
import 'custom_textfield.dart';

// Assuming CustomTextField and LabeledText are already imported.

class StepTwoForm extends StatelessWidget {
  final double w;

  const StepTwoForm({Key? key, required this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: w * .0),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * .04),
            child: Center(
              child: Text(
                'Tell us about the patient',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: w * .036,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          SizedBox(height: w * .02),

          CustomTextField(
            initialValue: "Mr Babu lal",
            keyboardType: TextInputType.number,
            suffixIcon: Image.asset(
              'assets/images/q.png',
              fit: BoxFit.contain,
            ),
            onChanged: (value) {
              print("Text field changed: $value");
            },
          ),

          SizedBox(height: w * .05),

          LabeledText(
            textStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.033,
              color: const Color.fromRGBO(107, 114, 128, 1),
            ),
            text: 'How much do you want to raise?',
          ),

          SizedBox(height: w * .02),

          CustomTextField(
            initialValue: "Above 40 years",
            keyboardType: TextInputType.number,
            suffixIcon: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 19,
              color: Color.fromRGBO(156, 163, 175, 1),
            ),
            onChanged: (value) {
              print("Text field changed: $value");
            },
          ),

          SizedBox(height: w * .05),

          LabeledText(
            textStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.033,
              color: const Color.fromRGBO(107, 114, 128, 1),
            ),
            text: 'Ailment / Medical Condition ',
          ),

          SizedBox(height: w * .02),

          CustomTextField(
            initialValue: "Bladder cancer/ bladder carcinoma",
            keyboardType: TextInputType.number,
            suffixIcon: Image.asset(
              'assets/images/sea.png',
              fit: BoxFit.contain,
            ),
            onChanged: (value) {
              print("Text field changed: $value");
            },
          ),

          SizedBox(height: w * .02),

          SizedBox(height: w * .05),

          CustomTextField(
            initialValue: "Currently hospitalised",
            keyboardType: TextInputType.number,
            suffixIcon: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 19,
              color: Color.fromRGBO(156, 163, 175, 1),
            ),
            onChanged: (value) {
              print("Text field changed: $value");
            },
          ),

          SizedBox(height: w * .05),

          LabeledText(
            textStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.033,
              color: const Color.fromRGBO(107, 114, 128, 1),
            ),
            text: 'Your Employment Status',
          ),

          SizedBox(height: w * .02),

          CustomTextField(
            initialValue: "Paras HMRI Hospital, Patna",
            keyboardType: TextInputType.number,
            suffixIcon: Image.asset(
              'assets/images/sea.png',
              fit: BoxFit.contain,
            ),
            onChanged: (value) {
              print("Text field changed: $value");
            },
          ),

          SizedBox(height: w * .05),

          LabeledText(
            textStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.033,
              color: const Color.fromRGBO(107, 114, 128, 1),
            ),
            text: 'Enter Your City ',
          ),

          SizedBox(height: w * .02),

          CustomTextField(
            initialValue: "Patna, Bihar, India",
            keyboardType: TextInputType.number,
            suffixIcon: Image.asset(
              'assets/images/loco.png',
              fit: BoxFit.contain,
            ),
            onChanged: (value) {
              print("Text field changed: $value");
            },
          ),

          SizedBox(height: w * .04),

          SizedBox(height: w * .04),
        ],
      ),
    );
  }
}
