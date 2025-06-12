import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unno/appPreferences/appColors.dart';

class CustomFormField {
  // for search text which it is not used in this project but it is for the future use.
  static Widget custTextFormSearch(
    BuildContext context,
    String hintText,
    int maxLine,
    int maxLength,
    Widget? prefixIcon,
    Widget? suffixIcon,
    TextInputType keyBoardType,
    Function(String) onChanged,
    TextEditingController controller,
    String? Function(String?) validator,
    bool focus,
    Function(String) onSubmitted,
    VoidCallback onClicked,
  ) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: controller,
      cursorHeight: w * .045,
      cursorColor: AppColors.primaryColor,
      validator: validator,
      autofocus: focus,
      autovalidateMode: AutovalidateMode.always,
      onTap: () {
        onClicked();
      },
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      style: GoogleFonts.inter(
        fontSize: w * .042,
        fontWeight: FontWeight.w500,
        color: Colors.black.withOpacity(.5),
      ),
      keyboardType: keyBoardType,
      maxLines: maxLine,
      maxLength: maxLength,
      decoration: InputDecoration(
        isDense: true,
        isCollapsed: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: Colors.transparent,
        prefixIconColor: Colors.blue,
        focusColor: Colors.blue,
        filled: true,
        counterText: "",
        contentPadding: EdgeInsets.only(left: w * .060),
        hintText: hintText.tr,
        hintStyle: GoogleFonts.inter(
          fontSize: w * .042,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade500,
        ),
        enabledBorder: InputBorder.none,
        border: InputBorder.none,
      ),
    );
  }

  //for login
  static Widget custTextFormLogin(
    BuildContext context,
    String hintText,
    int maxLine,
    int maxLength,
    Widget? prefixIcon,
    Widget? suffixIcon,
    TextInputType keyBoardType,
    Function(String) onChanged,
    TextEditingController controller,
    String? Function(String?) validator,
    bool focus,
    FocusNode focusNode,
    bool readOnly,
    Function(String) onSubmitted,
    VoidCallback onClicked,
  ) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return TextFormField(
      controller: controller,
      cursorHeight: h * .025,
      cursorColor: AppColors.primaryColor,
      focusNode: focusNode,
      readOnly: readOnly,
      // validator: validator,
      autofocus: focus,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: () {
        onClicked();
      },
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      style: GoogleFonts.lexendDeca(
        fontSize: w * .040,
        fontWeight: FontWeight.w500,
        color: Colors.black54,
      ),
      keyboardType: keyBoardType,
      maxLines: maxLine,
      maxLength: maxLength,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: Colors.green,
        prefixIconColor: Colors.blue,
        focusColor: Colors.grey,
        filled: false,
        counterText: "",
        contentPadding: EdgeInsets.only(left: w * .030),
        hintText: hintText.tr,
        hintStyle: GoogleFonts.lexendDeca(
          fontSize: w * .040,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade300,
        ),
        enabledBorder: InputBorder.none,
        border: InputBorder.none,
      ),
    );
  }

  //for name phone and other things
  static Widget custTextFormOther(
    BuildContext context,
    String hintText,
    int maxLine,
    int maxLength,
    Widget? prefixIcon,
    Widget? suffixIcon,
    TextInputType keyBoardType,
    Function(String) onChanged,
    TextEditingController controller,
    String? Function(String?) validator,
    bool focus,
    FocusNode focusNode,
    bool readOnly,
    Function(String) onSubmitted,
    VoidCallback onClicked,
  ) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return TextFormField(
      controller: controller,
      cursorHeight: h * .025,
      cursorColor: AppColors.primaryColor,
      focusNode: focusNode,
      readOnly: readOnly,
      // validator: validator,
      autofocus: focus,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: () {
        onClicked();
      },
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      style: GoogleFonts.lexendDeca(
        fontSize: w * .040,
        fontWeight: FontWeight.w500,
        color: Colors.black54,
      ),
      keyboardType: keyBoardType,
      maxLines: maxLine,
      maxLength: maxLength,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: Colors.green,
        prefixIconColor: Colors.blue,
        focusColor: Colors.grey,
        filled: false,
        counterText: "",
        contentPadding: EdgeInsets.only(
          left: w * .020,
          top: w * .035,
          bottom: w * .035,
          right: w * .040,
        ),
        hintText: hintText.tr,
        hintStyle: GoogleFonts.lexendDeca(
          fontSize: w * .040,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade300,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(w * .020),
          borderSide: BorderSide(color: AppColors.shadowColor, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(w * .020),
          borderSide: BorderSide(color: AppColors.shadowColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(w * .020),
          borderSide: BorderSide(color: AppColors.shadowColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(w * .020),
          borderSide: BorderSide(color: AppColors.shadowColor, width: 1),
        ),
      ),
    );
  }
}
