import 'package:flutter/material.dart';

class SlideLeftRoute extends PageRouteBuilder {
  final Widget page;

  SlideLeftRoute({required this.page})
    : super(
        transitionDuration: const Duration(
          milliseconds: 500,
        ), // Slightly longer for a smoother feel
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) => page,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          // Apply a curve to the animation
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.ease, // Start fast, end slow
          );

          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0), // Slide from right to left
              end: Offset.zero,
            ).animate(curvedAnimation),
            child: child,
          );
        },
      );
}

// left to right transition
class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
    : super(
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) => page,
        transitionsBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-2, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
      );
}

// Bottom to top transition
class SlideTopRoute extends PageRouteBuilder {
  final Widget page;
  SlideTopRoute({required this.page})
    : super(
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) => page,
        transitionsBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 2),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
      );
}
