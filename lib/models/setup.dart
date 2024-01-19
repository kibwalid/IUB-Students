import 'package:iub_students/models/bills.dart';
import 'package:iub_students/models/routine.dart';
import 'package:iub_students/models/user.dart';

class Setup {
  bool isLoggedIn;
  Routine routine;
  User user;
  List<Bill> bills;

  Setup(
      {required this.isLoggedIn,
      required this.routine,
      required this.user,
      required this.bills});
}
