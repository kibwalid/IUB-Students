import 'package:flutter/material.dart';
import 'package:iub_students/main.dart';
import 'package:iub_students/ui/authentication/login.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final Map<String, WidgetBuilder> routes = {
  Root.route: (context) => const Root(),
  LoginScreen.route: (context) => LoginScreen(),
};
