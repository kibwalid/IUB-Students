import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:iub_students/config.dart';
import 'package:iub_students/models/bills.dart';
import 'package:iub_students/models/course.dart';
import 'package:iub_students/models/event.dart';
import 'package:iub_students/models/exam.dart';
import 'package:iub_students/models/login.dart';
import 'package:iub_students/models/routine.dart';
import 'package:iub_students/models/setup.dart';
import 'package:iub_students/models/user.dart';
import 'package:iub_students/services/api_services.dart';
import 'package:iub_students/services/functional/utility_services.dart';
import 'package:iub_students/utils.dart';
import 'package:path_provider/path_provider.dart';

class UserServices {
  final ApiService _apiServices = ApiService();

  static Future<void> handleLogout() async {
    var userBox = await Hive.openBox('user');
    var routineBox = await Hive.openBox('routine');
    await userBox.deleteAll(["token", "login_data", "data"]);
    await routineBox.deleteAll(["classes"]);

    navigatorKey.currentState?.pushNamedAndRemoveUntil("/", (route) => false);
  }

  Future<Setup?> login(Login loginData) async {
    try {
      Map<String, dynamic> response = await _apiServices.postRequest(
          Config.loginApiURL,
          loginData.toJson(),
          UtilityServices.getPostHeader());
      if ("Success" == response["message"]) {
        var box = await Hive.openBox('user');
        await box.put("token", response["data"][0]["access_token"]);
        await box.put("login_data", loginData.toJsonString());

        return await refreshSetup(loginData);
      }
      UtilityServices.showDialog(navigatorKey.currentContext!,
          "IRAS ID and Password does not match. Please try again!");
    } catch (e) {
      UtilityServices.showDialog(navigatorKey.currentContext!,
          "Unable to fetch data from server. Please check your internet connection!");
    }

    return null;
  }

  Future<Setup> refreshSetup(Login? loginData) async {
    if (null == loginData) {
      var box = await Hive.openBox('user');
      loginData = Login.fromJson(json.decode(box.get("login_data")));
    }
    Routine routine = await fetchRoutineFromAPI(loginData);
    var routineBox = await Hive.openBox('routine');
    await routineBox.put("classes", routine.toJsonString());

    User user = await fetchUserFromAPI(loginData);
    var userBox = await Hive.openBox('user');
    await userBox.put("data", user.toJsonString());

    List<Bill> bills = await fetchBillFromAPI(loginData);
    await userBox.put(
        "bill", bills.map((e) => e.toJsonString()).toList().toString());

    String academic = await fetchAcademicsFromURL();
    await routineBox.put("academic", academic);
    Map<String, dynamic> academicMap = json.decode(academic);
    Map<String, List<Event>> events = {};

    List<String> keys = academicMap["events"].keys;
    for (int i = 0; i < keys.length; i++) {
      List<Map<String, dynamic>> rawEvent = academicMap["events"][keys[i]];
      events[keys[i]] = rawEvent.map((e) => Event.fromJson(e)).toList();
    }

    List<Map<String, dynamic>> rawExam = academicMap["exams"];

    List<Exam> exams =
        rawExam.map((element) => Exam.fromJson(element)).toList();

    return Setup(
        isLoggedIn: true,
        routine: routine,
        user: user,
        bills: bills,
        events: events,
        exams: exams);
  }

  Future<String> fetchAcademicsFromURL() async {
    return await _apiServices.getRequestWithoutDecode(
        Config.academicCalendarGithubURL, null);
  }

  Future<User> fetchUserFromAPI(Login loginData) async {
    Map<String, dynamic> response = await _apiServices.getRequest(
        Config.studentInfoApiURL(loginData.email),
        await UtilityServices.getHeaderWithToken());
    User user = _parseRawUser(response["data"]);
    return user;
  }

  Future<Routine> fetchRoutineFromAPI(Login loginData) async {
    Map<String, dynamic> response = await _apiServices.getRequest(
        Config.registeredCoursesApiURL(loginData.email),
        await UtilityServices.getHeaderWithToken());
    Routine routine = _parseRawRoutine(response["data"]);
    return routine;
  }

  Future<List<Bill>> fetchBillFromAPI(Login loginData) async {
    Map<String, dynamic> response = await _apiServices.getRequest(
        Config.billsApiURL(loginData.email),
        await UtilityServices.getHeaderWithToken());
    List<Bill> bills = _parseRawBills(response["data"]);
    return bills;
  }

  List<Bill> _parseRawBills(List<dynamic> rawBills) {
    return rawBills
        .where((element) => "U" == element['dueStatus'])
        .map((json) => Bill.fromJson(json))
        .toList();
  }

  Future<Setup> initalizeIUBStudents() async {
    if (!Hive.isBoxOpen("user")) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    var box = await Hive.openBox('user');
    bool isLoggedIn = box.get("token") != null;

    User user = User.empty();
    Routine routine = Routine.empty();
    List<Bill> bills = [];
    List<Exam> exams = [];
    Map<String, List<Event>> events = {};
    if (isLoggedIn) {
      routine = await fetchRoutineFromLocal();
      user = await fetchUserFromLocal();
      bills = await fetchBillFromLocal();
      List<dynamic> academic = await populateAcademicFromLocal();
      events = academic[0];
      exams = academic[1];
    }

    return Setup(
        isLoggedIn: isLoggedIn,
        routine: routine,
        user: user,
        bills: bills,
        events: events,
        exams: exams);
  }

  Future<List<dynamic>> populateAcademicFromLocal() async {
    var routineBox = await Hive.openBox('routine');
    var rawAcademic = routineBox.get("academic");
    if (null != rawAcademic) {
      Map<String, dynamic> academicMap = json.decode(rawAcademic);
      Map<String, List<Event>> events = {};
      List<String> keys = academicMap["events"].keys.toList();
      for (int i = 0; i < keys.length; i++) {
        List<dynamic> rawEvent = academicMap["events"][keys[i]];
        events[keys[i]] = rawEvent.map((e) => Event.fromJson(e)).toList();
      }

      List<dynamic> rawExam = academicMap["exams"];

      List<Exam> exams =
          rawExam.map((element) => Exam.fromJson(element)).toList();
      return [events, exams];
    }
    return [{}, []];
  }

  Future<Routine> fetchRoutineFromLocal() async {
    var routineBox = await Hive.openBox('routine');
    var rawRoutine = routineBox.get("classes");
    if (null != rawRoutine) {
      return Routine.fromJson(json.decode(rawRoutine));
    }
    return Routine.empty();
  }

  Future<User> fetchUserFromLocal() async {
    var userBox = await Hive.openBox('user');
    var rawUser = userBox.get("data");
    if (null != rawUser) {
      return User.fromJson(json.decode(rawUser));
    }
    return User.empty();
  }

  Future<List<Bill>> fetchBillFromLocal() async {
    List<Bill> bills = [];
    var userBox = await Hive.openBox('user');
    var rawBill = userBox.get("bill");
    if (null != rawBill) {
      List<dynamic> rawBillList = json.decode(rawBill);
      bills = rawBillList.map((e) => Bill.fromJson(e)).toList();
      return bills;
    }
    return bills;
  }

  User _parseRawUser(Map<String, dynamic> data) {
    return User(
        name: data['studentName'],
        cpga: data['cgpa'],
        creditsCompleted: data['earnedCredit'],
        id: data['studentId'],
        major: data['firstMajor']);
  }

  Routine _parseRawRoutine(List<dynamic> data) {
    Routine routine = Routine.empty();

    for (int i = 0; i < data.length; i++) {
      var json = data[i];
      List<String> parsedDate = _parseTimeString(json["classTime"]);
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

    return routine;
  }

  List<String> _parseTimeString(String timeString) {
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
