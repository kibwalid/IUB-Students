import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:iub_students/models/login.dart';
import 'package:iub_students/services/functional/user_services.dart';
import 'package:iub_students/ui/common/core_components.dart';

class LoginScreen extends StatelessWidget {
  static const String route = "/login";
  LoginScreen({super.key});

  UserServices userServices = UserServices();
  final _formKey = GlobalKey<FormState>();
  Login loginData = Login.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 35.h,
                        width: 100.w,
                        child: Image.asset(
                          'assets/images/logo.png',
                        ),
                      ),
                    ],
                  ),
                  CoreComponents.middleSpace(),
                  CoreComponents.getFormTextField(
                      label: "IRAS ID",
                      hintText: "Your IRAS ID",
                      textInputType: TextInputType.number,
                      password: false,
                      prefixIcon: Icon(Iconsax.user,
                          color: Colors.black87, size: 18.dp),
                      onSave: (value) {
                        loginData.email = value!;
                      }),
                  CoreComponents.middleSpace(),
                  CoreComponents.getFormTextField(
                      label: "Password",
                      hintText: "Password",
                      password: true,
                      prefixIcon: Icon(Iconsax.password_check,
                          color: Colors.black87, size: 18.dp),
                      onSave: (value) {
                        loginData.password = value!;
                      }),
                  CoreComponents.middleSpace(),
                  CoreComponents.middleSpace(),
                  MaterialButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        userServices.login(loginData);
                      }
                    },
                    height: 45,
                    color: const Color(0xff3347B0),
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 15.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Text("Login",
                        style: TextStyle(color: Colors.white, fontSize: 14.dp)),
                  ),
                  SizedBox(height: 10.h),
                  CoreComponents.credits(() {}),
                ],
              ),
            ),
          ),
        ));
  }
}
