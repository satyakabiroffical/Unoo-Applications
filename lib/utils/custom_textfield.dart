import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String initialValue;
  final String? hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final double widthFactor;
  final bool isDense;
  final EdgeInsets? contentPadding;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Color? textColor;
  final double? fontSize; // ✅ Add this

  const CustomTextField({
    Key? key,
    required this.initialValue,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.widthFactor = 0.04,
    this.isDense = false,
    this.contentPadding,
    this.controller,
    this.onChanged,
    this.textColor,
    this.fontSize, // ✅ Add this
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * widthFactor),
      child: SizedBox(
        width: double.maxFinite,
        child: TextField(
          controller: controller ?? TextEditingController(text: initialValue),
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: fontSize ?? w * .043, // ✅ Use passed fontSize
            color: textColor ?? Colors.black,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon != null
                ? Padding(
              padding: EdgeInsets.only(right: w * 0.01),
              child: SizedBox(
                width: w * 0.055,
                height: w * 0.055,
                child: suffixIcon,
              ),
            )
                : null,
            suffixIconConstraints: suffixIcon != null
                ? BoxConstraints(
              minWidth: w * 0.055,
              minHeight: w * 0.055,
            )
                : null,
            isDense: isDense,
            contentPadding: contentPadding,
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(209, 213, 219, 1), width: 2),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(209, 213, 219, 1), width: 2),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(0, 181, 226, 1), width: 2),
            ),
          ),
          keyboardType: keyboardType,
          onChanged: onChanged,
        ),
      ),
    );
  }
}



// Padding(
//   padding: EdgeInsets.symmetric(horizontal: w * .04),
//   child: SizedBox(
//     width: double.maxFinite,
//     child: TextField(
//       style: GoogleFonts.inter(
//         fontWeight: FontWeight.w400,
//         fontSize: w * .040,
//         color: Colors.black,
//       ),
//       decoration: InputDecoration(
//         suffixIcon: Padding(
//           padding: EdgeInsets.only(right: w * 0.01), // optional padding to the right
//           child: SizedBox(
//             width: w * 0.055,
//             height: w * 0.055,
//             child: Image.asset('assets/images/q.png', fit: BoxFit.contain),
//           ),
//         ),
//         suffixIconConstraints: BoxConstraints(
//           minWidth: w * 0.055,
//           minHeight: w * 0.055,
//         ),
//         // isDense: true,
//         // contentPadding: EdgeInsets.only(bottom: w * .01),
//         border: UnderlineInputBorder(
//           borderSide: BorderSide(color: Color.fromRGBO(209, 213, 219, 1), width: 2),
//         ),
//         enabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Color.fromRGBO(209, 213, 219, 1), width: 2),
//         ),
//         focusedBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Color.fromRGBO(19, 203, 106, 1), width: 2),
//         ),
//       ),
//       keyboardType: TextInputType.number,
//       controller: TextEditingController(text: "50000"),
//     ),
//   ),
// ),