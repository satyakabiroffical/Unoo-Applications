import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart'; // Import the dotted_border package

class MediaUploadContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String uploadButtonText;
  final VoidCallback? onUploadPressed;
  final Color borderColor;
  final Color uploadButtonTextColor;
  final Color uploadButtonBorderColor;
  final Color subtitleColor;
  final double horizontalMarginFactor;

  const MediaUploadContainer({
    Key? key,
    required this.title,
    this.subtitle = '(Optional)',
    this.uploadButtonText = 'Upload',
    this.onUploadPressed,
    this.borderColor = const Color.fromRGBO(0, 181, 226, 1),
    this.uploadButtonTextColor = const Color.fromRGBO(0, 181, 226, 1),
    this.uploadButtonBorderColor = const Color.fromRGBO(0, 181, 226, 1),
    this.subtitleColor = const Color.fromRGBO(153, 153, 153, 1),
    this.horizontalMarginFactor = 0.04,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * horizontalMarginFactor),
      child: DottedBorder( // Use DottedBorder
        borderType: BorderType.RRect,
        radius: const Radius.circular(5),
        dashPattern: const [6, 3], // Adjust dash pattern as needed
        color: borderColor,
        strokeWidth: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          width: w * .77,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: w * .03,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: w * .03,
                      color: subtitleColor,
                    ),
                  ),
                ],
              ),
              GestureDetector( // Use GestureDetector for tap
                onTap: onUploadPressed,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: uploadButtonBorderColor),
                  ),
                  child: Text(
                    uploadButtonText,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      color: uploadButtonTextColor,
                      fontSize: w * .04,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}