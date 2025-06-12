import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_status_label.dart';

class BloodCard extends StatelessWidget {
  final String imagePath;
  final String bloodType;
  final String status1;
  final Color status1Color;
  final String status2;
  final Color status2Color;

  const BloodCard({
    super.key,
    required this.imagePath,
    required this.bloodType,
    required this.status1,
    required this.status1Color,
    required this.status2,
    required this.status2Color,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: w * .42,
              height: w * .36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  bloodType,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: w * .1,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Padding(
          padding:   EdgeInsets.only(left: w *.032),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusLabel(
                text: status1,
                backgroundColor: status1Color,
                width: w * .19,
                height: w * .06,
              ),
              SizedBox(width: w *.02,),
              StatusLabel(
                text: status2,
                backgroundColor: status2Color,
                width: w * .19,
                height: w * .06,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
