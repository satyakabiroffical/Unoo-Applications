import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_label_text.dart';
import 'custom_richtext.dart';
import 'custom_textfield.dart';
import 'custom_upload_container.dart';


class StepOneWidget extends StatelessWidget {
  final double w;

  const StepOneWidget({Key? key, required this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: w * .05),

          FundRaisingTile(
            text: 'Medical Treatment',
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
            initialValue: "50000", // Ignored if you use controller
            keyboardType: TextInputType.number,
            suffixIcon: Image.asset(
              'assets/images/q.png',
              fit: BoxFit.contain,
            ),
            onChanged: (value) {
              print("Text field changed: $value");
              // update state or logic here
            },
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
            textStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.033,
              color: const Color.fromRGBO(107, 114, 128, 1),
            ),
            text: 'The Patient is my...',
          ),

          SizedBox(height: w * .02),

          CustomTextField(
            initialValue: "Grandfather", // Ignored if controller used
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
            text: 'Your Education Qualification',
          ),

          SizedBox(height: w * .02),

          CustomTextField(
            initialValue: "Graduate",
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
            initialValue: "Self-employed",
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

          SizedBox(height: w * .04),

          Row(
            children: [
              MediaUploadContainer(
                title: 'Add fundraiser image / video',
                onUploadPressed: () {
                  print('Upload button pressed');
                  // Add your upload logic here
                },
              ),

              SizedBox(
                width: w * 0.085,
                height: w * 0.085,
                child: Image.asset(
                  'assets/images/qq.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),

          SizedBox(height: w * .04),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
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
            padding: EdgeInsets.symmetric(
              horizontal: w * .03,
              vertical: w * .04,
            ),
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
// STEP 1 UI
// Widget _buildStepOne(double w) {
//   return    SingleChildScrollView(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: w * .05),
//
//
//         FundRaisingTile(
//           text: 'Medical Treatment',
//           icon: Icons.add,
//           onTap: () {
//             print('Tapped on Medical Treatment');
//             // Add your logic here
//           },
//         ),
//
//         SizedBox(height: w * .05),
//
//         LabeledText(
//           text: 'How much do you want to raise?',
//           showAsterisk: true,
//           textStyle: GoogleFonts.inter(
//             fontWeight: FontWeight.w500,
//             fontSize: MediaQuery.of(context).size.width * 0.033,
//             color: const Color.fromRGBO(107, 114, 128, 1),
//           ),
//         ),
//
//
//         SizedBox(height: w * .02),
//
//         // TEXT FIELD
//         CustomTextField(
//           initialValue:
//           "50000", // This is ignored because we are using a controller
//           // controller: _amountController,
//           keyboardType: TextInputType.number,
//           suffixIcon: Image.asset(
//             'assets/images/q.png',
//             fit: BoxFit.contain,
//           ),
//           onChanged: (value) {
//             print("Text field changed: $value");
//             // You can update state or perform other actions here
//           },
//         ),
//
//         SizedBox(height: w * .02),
//
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 18),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 'Should be minimum ₹ 2000',
//                 style: GoogleFonts.inter(
//                   fontWeight: FontWeight.w400,
//                   fontSize: w * .028,
//                   color: Color.fromRGBO(107, 114, 128, 1),
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//         SizedBox(height: w * .05),
//
//         LabeledText(
//
//           textStyle: GoogleFonts.inter(
//             fontWeight: FontWeight.w500,
//             fontSize: MediaQuery.of(context).size.width * 0.033,
//             color: const Color.fromRGBO(107, 114, 128, 1),
//           ),
//           text: 'The Patient is my...',
//         ),
//         SizedBox(height: w * .02),
//
//         CustomTextField(
//           initialValue:
//           "Grandfather", // This is ignored because we are using a controller
//           // controller: _amountController,
//           keyboardType: TextInputType.number,
//           suffixIcon: Icon(
//             Icons.arrow_forward_ios_outlined,
//             size: 19,
//             color: Color.fromRGBO(156, 163, 175, 1),
//           ),
//           onChanged: (value) {
//             print("Text field changed: $value");
//             // You can update state or perform other actions here
//           },
//         ),
//
//         SizedBox(height: w * .05),
//
//         LabeledText(
//           textStyle: GoogleFonts.inter(
//             fontWeight: FontWeight.w500,
//             fontSize: MediaQuery.of(context).size.width * 0.033,
//             color: const Color.fromRGBO(107, 114, 128, 1),
//           ),
//           text: 'Your Education Qualification',
//         ),
//         SizedBox(height: w * .02),
//
//         CustomTextField(
//           initialValue:
//           "Graduate", // This is ignored because we are using a controller
//           // controller: _amountController,
//           keyboardType: TextInputType.number,
//           suffixIcon: Icon(
//             Icons.arrow_forward_ios_outlined,
//             size: 19,
//             color: Color.fromRGBO(156, 163, 175, 1),
//           ),
//           onChanged: (value) {
//             print("Text field changed: $value");
//             // You can update state or perform other actions here
//           },
//         ),
//
//         SizedBox(height: w * .05),
//
//         LabeledText(
//           textStyle: GoogleFonts.inter(
//             fontWeight: FontWeight.w500,
//             fontSize: MediaQuery.of(context).size.width * 0.033,
//             color: const Color.fromRGBO(107, 114, 128, 1),
//           ),
//           text: 'Your Employment Status',
//         ),
//         SizedBox(height: w * .02),
//
//         CustomTextField(
//           initialValue:
//           "Self-employed", // This is ignored because we are using a controller
//           // controller: _amountController,
//           keyboardType: TextInputType.number,
//           suffixIcon: Icon(
//             Icons.arrow_forward_ios_outlined,
//             size: 19,
//             color: Color.fromRGBO(156, 163, 175, 1),
//           ),
//           onChanged: (value) {
//             print("Text field changed: $value");
//             // You can update state or perform other actions here
//           },
//         ),
//
//         // TEXT FIELD
//         SizedBox(height: w * .04),
//
//         Row(
//           children: [
//             MediaUploadContainer(
//               title: 'Add fundraiser image / video',
//               onUploadPressed: () {
//                 print('Upload button pressed');
//                 // Add your upload logic here
//               },
//             ),
//
//             SizedBox(
//               width: w * 0.085,
//               height: w * 0.085,
//               child: Image.asset(
//                 'assets/images/qq.png',
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ],
//         ),
//
//         //space from top
//         SizedBox(height: w * .04),
//
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 18),
//           child: Text(
//             'You can easily make changes to your fundraiser at any time',
//             style: GoogleFonts.inter(
//               fontWeight: FontWeight.w400,
//               fontSize: w * .027,
//               color: Color.fromRGBO(107, 114, 128, 1),
//             ),
//           ),
//         ),
//
//         SizedBox(height: w * .04),
//
//         Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: w * .03,
//             vertical: w * .04,
//           ),
//           margin: EdgeInsets.symmetric(horizontal: w * .04),
//           width: double.maxFinite,
//           color: Color.fromRGBO(240, 253, 250, 1),
//           child: Text(
//             'Unoo s zero platform fee policy will ensure more funds for you.',
//             style: GoogleFonts.inter(
//               fontSize: w * .027,
//               color: Color.fromRGBO(0, 181, 226, 1),
//             ),
//           ),
//         ),
//
//
//         SizedBox(height: w * .04),
//
//       ],
//     ),
//   );
// }
