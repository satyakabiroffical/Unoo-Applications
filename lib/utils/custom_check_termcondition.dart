import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSelectableContainer extends StatefulWidget {
  const CustomSelectableContainer({Key? key}) : super(key: key);

  @override
  State<CustomSelectableContainer> createState() =>
      _CustomSelectableContainerState();
}

class _CustomSelectableContainerState extends State<CustomSelectableContainer> {
  bool isSelected = false;

  final Color blueColor = const Color.fromRGBO(0, 181, 226, 1);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: w * 0.02),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Checkbox container
            Container(
              width: w * 0.045,
              height: w * 0.045,
              decoration: BoxDecoration(
                color: isSelected ? blueColor : Colors.white,
                border: Border.all(
                  color: blueColor,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: isSelected
                  ? Icon(
                Icons.check,
                color: Colors.white,
                size: w * 0.035,
              )
                  : null,
            ),
            const SizedBox(width: 10),

            // Text content with RichText
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: w * 0.032,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(text: "I agree to Unoo's "),
                    TextSpan(
                      text: 'Terms of Use',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: w * .033,
                        color: blueColor,
                      ),
                    ),
                    const TextSpan(text: ', service agreement ( '),
                    TextSpan(
                      text: 'USA and India',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: w * .033,
                        color: blueColor,
                      ),
                    ),
                    const TextSpan(text: ' ), '),
                    TextSpan(
                      text: 'Privacy Policy, Plans & Pricing*',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: w * .033,
                        color: blueColor,
                      ),
                    ),
                      TextSpan(
                        text:
                        ' and Medibuddy benefits. I acknowledge and confirm that the information provided above is true and correct to the best of my knowledge and belief and I agree to be liable if any of the above information is found to be false or misleading. I hereby give my consent for sharing it with regulatory authorities or disclosing it as may be required by law.'
                            ,style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: w * .033,
                      // color: blueColor,
                    ),

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
