import 'package:flutter/material.dart';

class CustomNavigator {
  /// Pushes a new page onto the stack
  static void push(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  /// Pops the current page from the stack
  static void pop(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  /// Replaces the current page with a new one
  static void pushReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  /// Removes all previous pages until the given condition is met
  static void removeUntil(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }
}
