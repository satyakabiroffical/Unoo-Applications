import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unno/appPreferences/apiUrls.dart';
import 'package:unno/appPreferences/userPreferences.dart';
import 'package:unno/models/fundDetails.model.dart';

class FundApi extends GetxController {
  // dio Initialize
  final dio = Dio();

  //getting fund details
  RxBool gettingFundDetails = false.obs;

  //fund details by id data
  RxList<FundDetails> fundDetailsById = RxList();

  //initialize user preferences
  UserPreference userPreference = Get.put(UserPreference());

  //get fund details by id function
  Future<bool> getFundDetailsById(String id) async {
    gettingFundDetails.value = true;
    try {
      final response = await dio.get(
        ApiUrls.getFundDetailsById,
        queryParameters: {'fundRaiseId': id},
      );

      print(response);

      if (response.data['success']) {
        final data = response.data['data'];
        fundDetailsById.clear();
        fundDetailsById.add(FundDetails.fromJson(data));

        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      gettingFundDetails.value = false;
    }

    return false;
  }

  //create donation api
  Future<bool> createDonationApi(
    BuildContext context,
    Map<String, dynamic> body,
  ) async {
    try {
      gettingFundDetails.value = true;

      print(body);
      final response = await dio.post(
        ApiUrls.createDonation,
        data: jsonEncode(body),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': userPreference.userToken.value,
          },
        ),
      );

      if (response.data['success']) {
        Get.snackbar(
          "Success",
          response.data['message'],
          backgroundColor: Colors.green,
          icon: Icon(Icons.check, color: Colors.white),
        );
        return true;
      } else {
        Get.snackbar(
          "Error",
          response.data['message'],
          backgroundColor: Colors.red,
          icon: Icon(Icons.close, color: Colors.white),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.red,
        icon: Icon(Icons.close, color: Colors.white),
      );
    } finally {
      gettingFundDetails.value = false;
    }

    return false;
  }
}
