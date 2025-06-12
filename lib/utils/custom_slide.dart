import 'package:flutter/cupertino.dart';
import 'package:unno/appPreferences/appColors.dart';

class CustomSlide {
  static Widget customSlideTransition({
    required BuildContext context,
    required double nowNumber,
    required double totalNumber,
    required double width,
  }) {
    double w = width;
    double percent = ((nowNumber / totalNumber) * 100);
    double percentWidth = (w * percent / 100);

    return Stack(
      children: [
        // Background container (full width)
        Container(
          height: w * .036,
          width: w,
          decoration: BoxDecoration(
            color: AppColors.primaryColorLight,
            borderRadius: BorderRadius.circular(w * .1),
          ),
        ),
        // Foreground container (progress)
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: w * .036,
            width: percentWidth,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(w * .1),
            ),
          ),
        ),
      ],
    );
  }
}
