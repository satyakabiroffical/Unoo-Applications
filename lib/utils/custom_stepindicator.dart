import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StepIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final double width;

  const StepIndicator({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(totalSteps * 2 - 1, (index) {
          if (index % 2 == 0) {
            int stepNumber = (index ~/ 2) + 1;
            bool isSelected = currentStep == stepNumber;

            return Container(
              width: width * .060,
              height: width * .060,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color.fromRGBO(0, 181, 226, 1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(width * .1),
                border: Border.all(
                  color: const Color.fromRGBO(0, 181, 226, 1),
                ),
              ),
              child: Center(
                child: Text(
                  '$stepNumber',
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontSize: width * .040,
                    color: isSelected
                        ? Colors.white
                        : const Color.fromRGBO(133, 141, 171, 1),
                  ),
                ),
              ),
            );
          }

          // Divider between steps
          return SizedBox(
            width: width * .2,
            child: Divider(
              color: const Color.fromRGBO(0, 181, 226, 1),
              thickness: 1,
            ),
          );
        }),
      ),
    );
  }
}



