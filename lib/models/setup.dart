import 'package:iub_students/models/bills.dart';
import 'package:iub_students/models/event.dart';
import 'package:iub_students/models/exam.dart';
import 'package:iub_students/models/routine.dart';
import 'package:iub_students/models/user.dart';

class Setup {
  bool isLoggedIn;
  Routine routine;
  User user;
  List<Bill> bills;
  Map<String, List<Event>> events;
  List<Exam> exams;

  Setup(
      {required this.isLoggedIn,
      required this.routine,
      required this.user,
      required this.bills,
      required this.events,
      required this.exams});

  int getCreditTaken() {
    int creditTaken = 0;
    Set<String> allCourses = {};
    for (int dayOfWeek = 1; dayOfWeek <= 7; dayOfWeek++) {
      List<String> courses =
          routine.getCourseList(dayOfWeek).map((e) => e.code).toList();
      allCourses.addAll(courses);
    }
    List<String> allCoursesList = allCourses.toList();

    for (int i = 0; i < allCoursesList.length; i++) {
      if ("L" == allCoursesList[i].substring(allCoursesList[i].length - 1)) {
        creditTaken += 1;
        continue;
      }
      creditTaken += 3;
    }
    return creditTaken;
  }
}
