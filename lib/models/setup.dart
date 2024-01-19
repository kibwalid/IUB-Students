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
}
