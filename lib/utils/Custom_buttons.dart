import 'package:flutter/material.dart';

class AppButtons {
  // solid button
  static Widget loginLike(
    BuildContext context,
    VoidCallback onClicked,
    Widget widget,
    Color color,
    bool isLoading,
    double height,
    double radius,
  ) {
    double w = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(Size(double.infinity, height)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
        backgroundColor: WidgetStateProperty.all(color),
      ),
      onPressed: () {
        if (!isLoading) {
          onClicked();
        }
      },
      child:
          isLoading
              ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: w * .030,
                    width: w * .030,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                  SizedBox(width: w * .020),
                  widget,
                ],
              )
              : widget,
    );
  }

  // outline button
  static Widget loginLikeWithBorder(
    BuildContext context,
    VoidCallback onClicked,
    Widget widget,
    Color color,
    Color backgroundColor,
    bool isLoading,
    double height,
    double radius,
  ) {
    double w = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(Size(double.infinity, height)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: color, width: 1),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(backgroundColor),
      ),
      onPressed: () {
        if (!isLoading) {
          onClicked();
        }
      },
      child:
          isLoading
              ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: w * .040,
                    width: w * .040,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: color,
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                  SizedBox(width: w * .020),
                  widget,
                ],
              )
              : widget,
    );
  }
}
