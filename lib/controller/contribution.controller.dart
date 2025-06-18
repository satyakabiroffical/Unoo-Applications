import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContributionController extends GetxController {
  //selected others
  RxBool isSelectedOthers = false.obs;

  //selected other in dropDown
  RxBool isSelectedOtherDropDown = false.obs;

  //selected currency
  RxString selectedCurrency = 'INR'.obs;

  //selected amount index
  RxInt selectedAmountIndex = 0.obs;

  //amount without donation
  RxDouble amountWithoutDonation = 0.0.obs;

  //tip amounts
  RxList<String> tip = RxList();

  //total amount with donation
  RxString totalTipAmount = '0'.obs;

  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> phone = TextEditingController().obs;
}
