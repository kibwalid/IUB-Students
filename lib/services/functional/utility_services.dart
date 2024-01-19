import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class UtilityServices {
  static Future<void> showDialog(BuildContext context, String message) {
    return Dialogs.materialDialog(
        msg: message,
        title: "Delete",
        color: Colors.white,
        context: context,
        actions: [
          IconsOutlineButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'Cancel',
            iconData: Icons.cancel_outlined,
            textStyle: const TextStyle(color: Colors.grey),
            iconColor: Colors.grey,
          ),
        ]);
  }

  static Map<String, String> getPostHeader() =>
      {"Accept": "application/json", "Content-Type": "application/json"};

  static Future<Map<String, String>> getPostHeaderWithToken() async {
    var box = await Hive.openBox('user');
    return {
      'Authorization': 'Bearer ${box.get("token")}',
      "Accept": "application/json",
      'Content-Type': 'application/json',
    };
  }

  static Future<Map<String, String>> getHeaderWithToken() async {
    var box = await Hive.openBox('user');
    return {
      'Authorization': 'Bearer ${box.get("token")}',
      'Content-Type': 'application/json',
    };
  }

  static String subText(String text, int range) {
    if (text.length < range + 1) {
      return text;
    } else {
      return "${text.substring(0, range)}...";
    }
  }

  static String getMonthInWords(DateTime dateTime) {
    List<String> monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'June',
      'July',
      'Aug',
      'Sept',
      'Oct',
      'Nov',
      'Dec',
    ];
    return monthNames[dateTime.month - 1];
  }
}
