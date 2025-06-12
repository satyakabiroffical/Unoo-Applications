import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController {
  // Date of birth (initialized with placeholder)
  RxString selectedDate1 = "DD/MM/YYYY".obs;

  // Function to select date using date picker
  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      // Format the selected date
      formatDate(pickedDate);
    } else {
      // User cancelled the picker
    }
  }

  // Format DateTime to DD/MM/YYYY and update observable
  void formatDate(DateTime date) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    selectedDate1.value = formattedDate;
    print(formattedDate);
  }
}
