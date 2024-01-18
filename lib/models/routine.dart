import 'package:iub_students/models/course.dart';

class Routine {
  List<Course> sunday;
  List<Course> monday;
  List<Course> tuesday;
  List<Course> wednesday;
  List<Course> thursday;
  List<Course> friday;
  List<Course> saturday;

  Routine({
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
  });

  factory Routine.fromJson(Map<String, dynamic> json) {
    return Routine(
      sunday: parseCourseList(json['Sunday']),
      monday: parseCourseList(json['Monday']),
      tuesday: parseCourseList(json['Tuesday']),
      wednesday: parseCourseList(json['Wednesday']),
      thursday: parseCourseList(json['Thursday']),
      friday: parseCourseList(json['Friday']),
      saturday: parseCourseList(json['Saturday']),
    );
  }

  factory Routine.empty() {
    return Routine(
        sunday: [],
        monday: [],
        tuesday: [],
        wednesday: [],
        thursday: [],
        friday: [],
        saturday: []);
  }

  List<Course> getCourseList(int dayOfWeek) {
    List<Course> courses;
    switch (dayOfWeek) {
      case 1:
        courses = monday;
        break;
      case 2:
        courses = tuesday;
        break;
      case 3:
        courses = wednesday;
        break;
      case 4:
        courses = thursday;
        break;
      case 5:
        courses = friday;
        break;
      case 6:
        courses = saturday;
        break;
      case 7:
        courses = sunday;
        break;
      default:
        throw Exception('Invalid day of week');
    }

    courses.sort((a, b) => a.startTime.compareTo(b.startTime));
    return courses;
  }

  static List<Course> parseCourseList(List<dynamic> list) {
    return list.map((item) => Course.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'Sunday': convertCourseListToJson(sunday),
      'Monday': convertCourseListToJson(monday),
      'Tuesday': convertCourseListToJson(tuesday),
      'Wednesday': convertCourseListToJson(wednesday),
      'Thursday': convertCourseListToJson(thursday),
      'Friday': convertCourseListToJson(friday),
      'Saturday': convertCourseListToJson(saturday),
    };
  }

  String toJsonString() {
    return """{
      'Sunday': ${convertCourseListToJsonString(sunday)},
      'Monday': ${convertCourseListToJsonString(monday)},
      'Tuesday': ${convertCourseListToJsonString(tuesday)},
      'Wednesday': ${convertCourseListToJsonString(wednesday)},
      'Thursday': ${convertCourseListToJsonString(thursday)},
      'Friday': ${convertCourseListToJsonString(friday)},
      'Saturday': ${convertCourseListToJsonString(saturday)}
    } """
        .replaceAll("'", "\"");
  }

  static List<Map<String, dynamic>> convertCourseListToJson(
      List<Course> courses) {
    return courses.map((course) => course.toJson()).toList();
  }

  static List<String> convertCourseListToJsonString(List<Course> courses) {
    return courses.map((course) => course.toJsonString()).toList();
  }

  void addCourse(String parsedDate, Course course) {
    for (int i = 0; i < parsedDate.length; i++) {
      switch (parsedDate[i]) {
        case 'M':
          monday.add(course);
          break;
        case 'T':
          tuesday.add(course);
          break;
        case 'W':
          wednesday.add(course);
          break;
        case 'R':
          thursday.add(course);
          break;
        case 'F':
          friday.add(course);
          break;
        case 'A':
          saturday.add(course);
          break;
        case 'S':
          sunday.add(course);
          break;
        default:
          throw Exception('Invalid day of week');
      }
    }
  }
}
