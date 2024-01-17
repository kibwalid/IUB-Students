import 'package:hive/hive.dart';
import 'package:iub_students/config.dart';
import 'package:iub_students/models/login.dart';
import 'package:iub_students/services/api_services.dart';
import 'package:iub_students/services/functional/utility_services.dart';
import 'package:iub_students/utils.dart';

class UserServices {
  final ApiService _apiServices = ApiService();

  Future<void> login(Login loginData) async {
    Map<String, dynamic> response = await _apiServices.postRequest(
        Config.loginApiURL,
        loginData.toJson(),
        UtilityServices.getPostHeader());

    if ("Success" == response["message"]) {
      var box = await Hive.openBox('user');
      print(response["data"][0]["access_token"]);
      box.put("token", response["data"][0]["access_token"]);

      navigatorKey.currentState!
          .pushNamedAndRemoveUntil("/routine", (route) => false);
    } else {
      UtilityServices.showDialog(navigatorKey.currentContext!,
          "IRAS ID and Password does not match, Please try again!");
    }
  }
}
