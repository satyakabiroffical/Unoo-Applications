import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusLabel extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final double width;
  final double height;

  const StatusLabel({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: width * .12, // dynamic based on width for consistency
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
