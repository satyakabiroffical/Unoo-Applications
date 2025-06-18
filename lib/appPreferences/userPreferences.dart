import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference extends GetxController {
  //user id and user token
  RxString userId = "6815a20a1d536533ed37248e".obs;
  RxString userToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4MWRmMWM2MDcyNDZhOWY3MDhhNzliYyIsImVtYWlsIjoiamFpbjMwMmphaW5AZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOjg4ODg4NTU1NTksImlhdCI6MTc1MDI0NDIwNCwiZXhwIjoxNzUwODQ5MDA0fQ.8rQagD-3aFeNuYM_rABHlRCGXuuGvaA0J3WjxX4DGkM"
          .obs;

  //function to store user id and user token in local storage
  Future<void> storeUser(String id, String token) async {
    userId.value = id;
    userToken.value = token;
    //store in local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', id);
    prefs.setString('user_token', token);
  }

  //function to get data from local Storage
  Future<void> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId.value = prefs.getString('user_id') ?? "";
    userToken.value = prefs.getString('user_token') ?? "";
  }
}
