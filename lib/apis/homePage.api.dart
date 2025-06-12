import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unno/appPreferences/apiUrls.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/models/homeBanner.model.dart';
import 'package:unno/models/topBloodBanks.model.dart';
import 'package:unno/models/topNgos.model.dart';
import 'package:unno/models/trendingFundraisers.model.dart';

class HomePageApi extends GetxController {
  // dio Initialize
  final dio = Dio();

  //get home page loading
  RxBool gettingHomeData = false.obs;

  //homePage banners
  RxList<HomeBanner> bannerData = RxList();

  //trending Fundraisers
  RxList<TrendingFundRaisers> trendingFundRaisers = RxList();

  //top ngos list
  RxList<TopNgos> topNgosList = RxList();

  //top blood banks
  RxList<TopBloodBanks> topBloodBanks = RxList();

  //get home page data api
  Future<bool> getHomePageData() async {
    gettingHomeData.value = true;

    try {
      final response = await dio.get(ApiUrls.getHomePage);

      if (response.data['success']) {
        final data = response.data['data'];

        //getting banners
        bannerData.clear();
        for (dynamic items in data['Banner']['homeImage']) {
          bannerData.add(HomeBanner.fromJson(items));
        }

        //trending fundraisers
        trendingFundRaisers.clear();
        for (dynamic items in data['topFundRaise']) {
          trendingFundRaisers.add(TrendingFundRaisers.fromJson(items));
        }

        //top ngos
        topNgosList.clear();
        for (dynamic items in data['topNGO']) {
          topNgosList.add(TopNgos.fromJson(items));
        }

        //top blood banks
        topBloodBanks.clear();
        for (dynamic items in data['topBloodBank']) {
          topBloodBanks.add(TopBloodBanks.fromJson(items));
        }
      } else {
        Get.snackbar(
          'Error',
          response.data['message'],
          backgroundColor: AppColors.redColor,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      gettingHomeData.value = false;
    }

    //return default value
    return false;
  }
}
