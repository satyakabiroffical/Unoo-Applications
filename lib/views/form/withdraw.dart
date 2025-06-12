import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../appPreferences/appColors.dart';
import '../../utils/Custom_buttons.dart';
import '../../utils/custom_dropdown_textfield.dart';
import '../../utils/custom_fundsummary.dart';
import '../../utils/custom_label_text.dart';
import '../../utils/custom_text.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({super.key});

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteFontColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteFontColor,
        title:   Text(
          "My fundraises",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: w * .045,
            color: AppColors.blackFontColor,
          ),
        ),
      ),

      body: Column(

        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: w *.07),
            padding: EdgeInsets.symmetric(vertical: w *.05),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white, // Required for shadow to show up properly
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 1,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                LabeledText(
                  text: 'Total Raised',
                  showAsterisk: false,
                  textStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: w * .03,),
                LabeledText(
                  text: '₹ 0',
                  showAsterisk: false,
                  textStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                    color: Color.fromRGBO(0, 181, 226, 1),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: w * .05,),
          FundWithdrawalCard(
            width: MediaQuery.of(context).size.width,
            accountField: CustomDropdownTextField(
              borderColor: const Color.fromRGBO(85, 85, 85, 1),
              hintText: 'Account Number',
              onTap: () {
                // Your logic
              },
            ),
          ),



          SizedBox(height: w * .05,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * .07),
            child:   AppButtons.loginLike(
              context,
                  () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFundraiser()));
              },
              AppFonts.textInter(
                context,
                "Add Beneficiary Documents",
                w * .040,
                FontWeight.w700,
                AppColors.whiteFontColor,
                TextAlign.start,
                TextOverflow.ellipsis,
              ),
              AppColors.primaryColor,
              false,
              w * .130,
              w * .020,
            ),
          ),
          SizedBox(height: w * .05,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * .07),
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.width * 0.036,
                  color: Color.fromRGBO(68, 68, 68, 1),
                ),
                children: [
                  TextSpan(
                    text: 'In case you would like to transfer money directly to the hospital, email us at ',
                  ),
                  TextSpan(
                    text: 'Info@123.org',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 181, 226, 1), // Blue color
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
