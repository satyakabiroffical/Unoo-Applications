import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoNoteBox extends StatelessWidget {
  final String message;
  final String imagePath;

  const InfoNoteBox({
    Key? key,
    required this.message,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 18),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(243, 244, 246, 1),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 0),
            width: w * 0.070,
            height: w * 0.070,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: w * 0.031,
                color: const Color.fromRGBO(68, 68, 68, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
