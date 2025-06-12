import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static Widget textInter(
    BuildContext context,
    String item,
    double size,
    FontWeight weight,
    Color color,
    TextAlign textAlign,
    TextOverflow overflow,
  ) {
    return Text(
      textAlign: textAlign,
      overflow: overflow,
      item,
      style: GoogleFonts.inter(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
