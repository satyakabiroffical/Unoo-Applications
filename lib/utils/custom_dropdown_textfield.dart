import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdownTextField extends StatelessWidget {
  final String hintText;
  final double verticalPadding;
  final double horizontalPadding;
  final double borderRadius;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final IconData? defaultSuffixIconData;
  final Color? defaultSuffixIconColor;

  final int? maxLines;
  final int? minLines;

  final Color borderColor;

  /// Add this:
  final FontStyle? fontStyle;

  const CustomDropdownTextField({
    super.key,
    this.hintText = 'Select',
    this.verticalPadding = 16,
    this.horizontalPadding = 16,
    this.borderRadius = 8,
    this.controller,
    this.onTap,
    this.readOnly = true,
    this.prefixIcon,
    this.suffixIcon,
    this.defaultSuffixIconData,
    this.defaultSuffixIconColor,
    this.maxLines = 1,
    this.minLines,
    this.borderColor = const Color.fromRGBO(204, 204, 204, 1),
    this.fontStyle, // Add parameter here
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    final outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: borderColor),
    );

    return TextField(
      readOnly: readOnly,
      controller: controller,
      onTap: onTap,
      maxLines: maxLines,
      minLines: minLines,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: w * 0.036,
        fontStyle: fontStyle ?? FontStyle.normal, // Use it here
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: w * 0.036,
          fontStyle: fontStyle ?? FontStyle.normal,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon ??
            (defaultSuffixIconData != null
                ? Icon(
              defaultSuffixIconData,
              color: defaultSuffixIconColor ?? Colors.black,
            )
                : null),
        contentPadding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        enabledBorder: outlineBorder,
        focusedBorder: outlineBorder,
        border: outlineBorder,
      ),
    );
  }
}

