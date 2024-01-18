import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:iub_students/config.dart';
import 'package:iub_students/models/course.dart';
import 'package:iub_students/models/login.dart';
import 'package:iub_students/models/routine.dart';
import 'package:iub_students/models/setup.dart';
import 'package:iub_students/services/api_services.dart';
import 'package:iub_students/services/functional/utility_services.dart';
import 'package:iub_students/utils.dart';
import 'package:path_provider/path_provider.dart';

class UserServices {
  final ApiService _apiServices = ApiService();

  Future<Setup?> login(Login loginData) async {
    Map<String, dynamic> response = await _apiServices.postRequest(
        Config.loginApiURL,
        loginData.toJson(),
        UtilityServices.getPostHeader());

    if ("Success" == response["message"]) {
      var box = await Hive.openBox('user');
      await box.put("token", response["data"][0]["access_token"]);
      await box.put("login_data", loginData.toJsonString());

      return await initalizeIUBStudents();
    }
    UtilityServices.showDialog(navigatorKey.currentContext!,
        "IRAS ID and Password does not match. Please try again!");
    return null;
  }

  Future<Setup> initalizeIUBStudents() async {
    if (!Hive.isBoxOpen("user")) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    var box = await Hive.openBox('user');
    bool isLoggedIn = box.get("token") != null;

    Routine routine = Routine.empty();
    if (isLoggedIn) {
      routine = await fetchRoutine();
    }
    return Setup(isLoggedIn: isLoggedIn, routine: routine);
  }

  Future<Routine> fetchRoutine() async {
    // Fetching routine from local
    var routineBox = await Hive.openBox('routine');
    var rawRoutine = routineBox.get("classes");

    if (null != rawRoutine) {
      print(rawRoutine);
      return Routine.fromJson(json.decode(rawRoutine));
    }

    // Fetching routine from IRAS Server
    return await fetchRoutineFromIras(refresh: false);
  }

  Future<Routine> fetchRoutineFromIras({required bool refresh}) async {
    var box = await Hive.openBox('user');
    Login loginData = Login.fromJson(json.decode(box.get("login_data")));

    if (refresh) {
      Setup? setup = await login(loginData);
      if (null != setup) {
        var routineBox = await Hive.openBox('routine');
        await routineBox.put("classes", setup.routine.toJsonString());
        return setup.routine;
      }
      return Routine.empty();
    }

    Map<String, dynamic> response = await _apiServices.getRequest(
        Config.registeredCoursesApiURL(loginData.email),
        await UtilityServices.getHeaderWithToken());
    Routine routine = _parseRawRoutine(response["data"]);

    var routineBox = await Hive.openBox('routine');
    await routineBox.put("classes", routine.toJsonString());
    return routine;
  }

  Routine _parseRawRoutine(List<dynamic> data) {
    Routine routine = Routine.empty();

    for (int i = 0; i < data.length; i++) {
      var json = data[i];
      List<String> parsedDate = parseTimeString(json["classTime"]);
      if ("Z" == json["grade"]) {
        Course course = Course(
            code: json["courseId"],
            name: json["courseName"],
            sec: json["section"].toString(),
            room: json["roomId"],
            attendance: json["attend"].toString(),
            grade: "Z",
            startTime: parsedDate[1],
            endTime: parsedDate[2]);
        routine.addCourse(parsedDate[0], course);
      }
    }

    print(routine.sunday);

    return routine;
  }

  List<String> parseTimeString(String timeString) {
    List<String> splitByDash = timeString.split('-');

    if (2 != splitByDash.length) {
      return [];
    }

    String days = splitByDash[0];
    String endTime = splitByDash[1];
    List<String> splitByColon = days.split(':');
    if (3 != splitByColon.length) {
      return [];
    }

    String day = splitByColon[0];
    String startTime = "${splitByColon[1]}:${splitByColon[2]}";
    return [day, startTime, endTime];
  }
}
