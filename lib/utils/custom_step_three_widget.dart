import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_check_termcondition.dart';
import 'custom_dropdown_textfield.dart';
import 'custom_infonote_box.dart';
import 'custom_upload_container.dart';

// Make sure to import your custom widgets:
// CustomDropdownTextField, MediaUploadContainer, InfoNoteBox, CustomSelectableContainer

class StepThreeForm extends StatelessWidget {
  final double w;

  const StepThreeForm({Key? key, required this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: w * .00),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * .04),
          child: Text(
            'Tell the story about why you are running a Fundraiser',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w700,
              fontSize: w * .034,
              color: Colors.black,
            ),
          ),
        ),

        SizedBox(height: w * .05),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.03),
          child: CustomDropdownTextField(
            borderRadius: 5,
            maxLines: 15,
            fontStyle: FontStyle.italic,
            hintText:
            'Hi,\nMy name is Ayush Ranjan and I am raising funds for my grandfather, Mr Babu lal who is suffering from Bladder cancer/ bladder carcinoma and is undergoing treatment at Paras HMRI Hospital, Patna. The family has done all it can to collect the total amount required for the treatment but Rs.50000 more is required to pay for all the medical expenses.As the amount required is huge, I request you to kindly contribute towards the treatment and help during this time of As the amount required is huge, I request you to kindly contribute towards the treatment and help during this time',
            onTap: () {
              // Show bottom sheet or modal here
            },
          ),
        ),

        SizedBox(height: w * .06),

        Row(
          children: [
            MediaUploadContainer(
              title: 'Add fundraiser image / video',
              onUploadPressed: () {
                print('Upload button pressed');
                // Add your upload logic here
              },
            ),

            Container(
              width: w * 0.060,
              height: w * 0.060,
              child: Image.asset(
                'assets/images/qq.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),

        SizedBox(height: w * .04),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            'You can easily make changes to your fundraiser at any time',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: w * .027,
              color: const Color.fromRGBO(107, 114, 128, 1),
            ),
          ),
        ),

        SizedBox(height: w * .04),

        InfoNoteBox(
          message:
          "Don’t worry! You can skip this step for now and\nadd the story details and medical documents\nafter submitting.",
          imagePath: 'assets/images/emoji.png',
        ),

        SizedBox(height: w * .04),

        CustomSelectableContainer(),

        SizedBox(height: w * .04),
      ],
    );
  }
}


// STEP 3 UI
// Widget _buildStepThree(double w) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//
//       SizedBox(height: w * .00),
//
//
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: w * .04),
//         child: Text(
//           'Tell the story about why you are running a Fundraiser',
//           style: GoogleFonts.inter(
//             fontWeight: FontWeight.w700,
//             fontSize: w * .034,
//             color: Colors.black,
//           ),
//         ),
//       ),
//
//       SizedBox(height: w * .05),
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: w * 0.03),
//         child: CustomDropdownTextField(
//           borderRadius: 5,
//           maxLines: 15,
//           fontStyle: FontStyle.italic,
//           hintText: 'Hi,\nMy name is Ayush Ranjan and I am raising funds for my grandfather, Mr Babu lal who is suffering from Bladder cancer/ bladder carcinoma and is undergoing treatment at Paras HMRI Hospital, Patna. The family has done all it can to collect the total amount required for the treatment but Rs.50000 more is required to pay for all the medical expenses.As the amount required is huge, I request you to kindly contribute towards the treatment and help during this time of As the amount required is huge, I request you to kindly contribute towards the treatment and help during this time',
//           onTap: () {
//             // Show bottom sheet or modal here
//           },
//         ),
//       ),
//       SizedBox(height: w * .06),
//
//       Row(
//         children: [
//           MediaUploadContainer(
//             title: 'Add fundraiser image / video',
//             onUploadPressed: () {
//               print('Upload button pressed');
//               // Add your upload logic here
//             },
//           ),
//
//           Container(
//             width: w * 0.060,
//             height: w * 0.060,
//             child: Image.asset(
//               'assets/images/qq.png',
//               fit: BoxFit.contain,
//             ),
//           ),
//         ],
//       ),
//
//       SizedBox(height: w * .04),
//
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18),
//         child: Text(
//           'You can easily make changes to your fundraiser at any time',
//           style: GoogleFonts.inter(
//             fontWeight: FontWeight.w400,
//             fontSize: w * .027,
//             color: Color.fromRGBO(107, 114, 128, 1),
//           ),
//         ),
//       ),
//
//       SizedBox(height: w * .04),
//
//       InfoNoteBox(
//         message:
//         "Don’t worry! You can skip this step for now and\nadd the story details and medical documents\nafter submitting.",
//         imagePath: 'assets/images/emoji.png',
//       ),
//
//
//       SizedBox(height: w * .04),
//
//
//       CustomSelectableContainer(),
//
//
//       SizedBox(height: w * .04),
//     ],
//   );
// }