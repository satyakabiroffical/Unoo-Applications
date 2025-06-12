import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unno/views/bottomNavScreen/add_screen.dart';
import 'package:unno/views/bottomNavScreen/donation_screen.dart';
import 'package:unno/views/bottomNavScreen/home_screen.dart';
import 'package:unno/views/bottomNavScreen/profile_screen.dart';
import 'package:unno/views/bottomNavScreen/reel_screen.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  RxBool countPixal = true.obs;

  RxList<Widget> screens =
      [
        HomeScreen(),
        ReelScreen(),
        AddScreen(),
        DonationScreen(),
        ProfileScreen(),
      ].obs;
}
