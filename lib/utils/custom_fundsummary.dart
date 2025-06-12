import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FundWithdrawalCard extends StatelessWidget {
  final double width;
  final Widget accountField;

  const FundWithdrawalCard({
    super.key,
    required this.width,
    required this.accountField,
  });

  @override
  Widget build(BuildContext context) {
    double w = width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: w * .07),
      padding: EdgeInsets.symmetric(vertical: w * .05),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'See the Funds breakup in the',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: w * 0.04,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: w * .03),
          Center(
            child: Text(
              'Funds Summary',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: w * 0.049,
                color: const Color.fromRGBO(0, 181, 226, 1),
              ),
            ),
          ),
          Padding(
            padding:   EdgeInsets.symmetric(horizontal: w * .222),
            child: Divider(thickness: 1,color:  Color.fromRGBO(0, 181, 226, 1),),
          ),
          SizedBox(height: w * .04),
          Padding(
            padding:   EdgeInsets.symmetric(horizontal: w * .044),
            child: Text(
              textAlign: TextAlign.center,
              'To withdraw please add bank details of the beneficiary.',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: w * 0.039,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: w * .04),
          Padding(
            padding:   EdgeInsets.symmetric(horizontal: w * .044),
            child: Text(
              'Please enter your Account Number',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: w * 0.04,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: w * .03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: accountField,
          ),
        ],
      ),
    );
  }
}
