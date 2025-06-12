import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  // check to select fundraisers
  RxInt selectedFundraiser = 0.obs;

  // check to select gender
  RxInt genNo = (-1).obs;

  //gender string
  RxString gender = 'Select Gender'.obs;
}
