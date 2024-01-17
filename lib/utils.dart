import 'package:flutter/material.dart';
import 'package:iub_students/main.dart';
import 'package:iub_students/ui/authentication/login.dart';
import 'package:iub_students/ui/routine/routine.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final Map<String, WidgetBuilder> routes = {
  Root.route: (context) => const Root(),
  LoginScreen.route: (context) => LoginScreen(),
  Routine.route: (context) => const Routine()
};
