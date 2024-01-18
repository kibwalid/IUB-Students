import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:iub_students/screen_wrapper.dart';
import 'package:iub_students/services/functional/user_services.dart';
import 'package:iub_students/models/setup.dart';
import 'package:iub_students/ui/authentication/login.dart';
import 'package:iub_students/utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, screenType) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: "/",
          navigatorKey: navigatorKey,
          routes: routes,
        ),
      );
    });
  }
}

class Root extends StatefulWidget {
  const Root({super.key});
  static const String route = "/";

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  UserServices userServices = UserServices();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Setup>(
        future: userServices.initalizeIUBStudents(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Setup setup = snapshot.data!;
            if (setup.isLoggedIn) {
              return ScreenWrapper(
                setup: setup,
              );
            }
            return LoginScreen();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Container(
              color: Colors.white,
              child: Center(
                child: LoadingAnimationWidget.prograssiveDots(
                  color: const Color(0xff3347B0),
                  size: 75,
                ),
              ),
            );
          }
        });
  }
}
