import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FundRaisingTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final double widthFactor;

  const FundRaisingTile({
    Key? key,
    required this.text,
    required this.icon,
    this.iconColor = Colors.white,
    this.backgroundColor = const Color.fromRGBO(19, 203, 106, 1),
    this.onTap,
    this.widthFactor = 0.04,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * widthFactor),
      child: InkWell( // Use InkWell for tap effect
        onTap: onTap,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(w * .1),
              ),
              width: w * .065,
              height: w * .065,
              child: Icon(
                icon,
                color: iconColor,
                size: 18,
              ),
            ),
            SizedBox(
              width: w * .02,
            ),
            RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: w * .035,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Raising funds for\u00A0',style: GoogleFonts.inter(fontSize: w * .037,fontWeight: FontWeight.w400)), // Add non-breaking space
                  TextSpan(
                    text: 'Medical Treatment',
                    style:   GoogleFonts.inter(fontSize: w * .037,fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: '\u00A0purpose',style: GoogleFonts.inter(fontSize: w * .037,fontWeight: FontWeight.w400)), // Add non-breaking space
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Padding(
//   padding:   EdgeInsets.symmetric(horizontal: w * .04),
//   child: Row(
//     children: [
//       Container(
//         padding: EdgeInsets.all(0),
//         decoration: BoxDecoration(
//           color: Color.fromRGBO(19, 203, 106, 1),
//             borderRadius: BorderRadius.circular(w * .1,),
//
//         ),
//         width:  w * .060,
//         height:  w * .060,
//        child: Icon(Icons.add,color: Colors.white,size: 18,)
//
//       ),
//       SizedBox(
//         width: w * .02,
//       ),
//
//     ],
//   ),
// ),