import 'package:flutter/material.dart';

class LabeledText extends StatelessWidget {
  final String text;
  final double horizontalPadding;
  final TextStyle? textStyle;
  final Color asteriskColor;
  final bool showAsterisk;

  const LabeledText({
    Key? key,
    required this.text,
    this.horizontalPadding = 18.0,
    this.textStyle,
    this.asteriskColor = Colors.red,
    this.showAsterisk = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: MediaQuery.of(context).size.width * 0.033,
      color: const Color.fromRGBO(107, 114, 128, 1),
    );

    final effectiveStyle = textStyle ?? defaultStyle;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: RichText(
        text: TextSpan(
          style: effectiveStyle,
          children: [
            TextSpan(text: text,),
            if (showAsterisk)
              TextSpan(
                text: ' *',
                style: effectiveStyle.copyWith(color: asteriskColor),
              ),
          ],
        ),
      ),
    );
  }
}

// Padding(
// padding:   EdgeInsets.symmetric(horizontal : 18),
// child:
// Text('How much do you want to raise? ',style: GoogleFonts.inter(
// fontWeight: FontWeight.w500,
// fontSize: w * .033,
// color: Color.fromRGBO(107, 114, 128, 1)
// ),
//
// ),
// ),