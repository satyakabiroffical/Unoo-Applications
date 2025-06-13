import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unno/appPreferences/apiUrls.dart';
import 'package:unno/models/fundDetails.model.dart';

class FundApi extends GetxController {
  // dio Initialize
  final dio = Dio();

  //getting fund details
  RxBool gettingFundDetails = false.obs;

  //fund details by id data
  RxList<FundDetails> fundDetailsById = RxList();

  //get fund details by id function
  Future<bool> getFundDetailsById(String id) async {
    gettingFundDetails.value = true;
    try {
      final response = await dio.get(
        ApiUrls.getFundDetailsById,
        queryParameters: {'fundRaiseId': '68148a22319f2bd4d2fb70bf'},
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
}
