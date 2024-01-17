import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CoreComponents {
  static Widget getFormTextField(
      {required String label,
      required String hintText,
      required bool password,
      TextInputType? textInputType,
      Function(String?)? onSave,
      Widget? prefixIcon,
      String? Function(String?)? validate}) {
    return TextFormField(
      obscureText: password,
      onSaved: onSave,
      validator: validate,
      cursorColor: Colors.black,
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12.0),
        labelText: label,
        hintText: label,
        labelStyle: TextStyle(
            color: Colors.black, fontSize: 14.dp, fontWeight: FontWeight.w400),
        hintStyle: TextStyle(color: Colors.grey, fontSize: 14.dp),
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
          borderRadius: BorderRadius.circular(0),
        ),
        floatingLabelStyle:
            const TextStyle(color: Colors.black, fontSize: 18.0),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff3347B0), width: 1.5),
          borderRadius: BorderRadius.zero,
        ),
      ),
    );
  }

  static SizedBox middleSpace() {
    return SizedBox(height: 2.h);
  }

  static Widget credits(Function() onClickName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Developed by",
          style: TextStyle(fontSize: 12.dp, fontWeight: FontWeight.w400),
        ),
        TextButton(
            onPressed: onClickName, child: const Text("Khalid Ibnul Walid")),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 12.w,
                child: Image.asset("assets/images/arrows_logo.png")),
            SizedBox(
                height: 20.w,
                child: Image.asset("assets/images/iub_cse_logo.png"))
          ],
        )
      ],
    );
  }
}
