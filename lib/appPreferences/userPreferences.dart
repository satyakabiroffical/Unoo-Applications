import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference extends GetxController {
  //user id and user token
  RxString userId = "".obs;
  RxString userToken = "".obs;

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
