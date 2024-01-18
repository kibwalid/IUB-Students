import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:intl/intl.dart';
import 'package:iub_students/models/course.dart';
import 'package:iub_students/models/routine.dart';

class RoutineScreen extends StatefulWidget {
  final Routine routine;
  const RoutineScreen({super.key, required this.routine});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.h, left: 5.w, right: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Your Classes",
            style: TextStyle(fontSize: 28.dp, fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            width: 10.w,
            height: 0.6.h,
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.5),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          SizedBox(
            height: 79.h,
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildRoutine(),
            )),
          ),
        ],
      ),
    );
  }

  String buildCourseText(String text) {
    if (text.length < 22) {
      return text;
    } else {
      return "${text.substring(0, 21)}...";
    }
  }

  String buildDayText(int i) {
    if (i == 0) {
      return "Today";
    } else if (i == 1) {
      return "Tomorrow";
    } else {
      return DateFormat('dd MMMM, EEEE')
          .format(DateTime.now().add(Duration(days: i)))
          .toString();
    }
  }

  List<Widget> _buildRoutine() {
    List<Widget> widgets = [];
    for (int i = 0; i < 7; i++) {
      List<Course> coursesThisDay = widget.routine
          .getCourseList(DateTime.now().add(Duration(days: i)).weekday);
      widgets.add(
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                buildDayText(i),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.dp,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 1.25.h),
              for (int j = 0; j < coursesThisDay.length; j++)
                _buildCourseWidget(coursesThisDay[j]),
              if (coursesThisDay.isEmpty)
                Text("You don't have any class on this day.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 11.dp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic))
            ],
          ),
        ),
      );
    }
    widgets.add(SizedBox(height: 3.h));
    return widgets;
  }

  Widget _buildCourseWidget(Course course) {
    return Column(
      children: [
        Container(
          width: double.infinity, // Sets the width to the screen width
          height: 13.h,
          color: const Color(0xffEBF1F8),
          child: Row(
            children: [
              Container(
                color: const Color(0xff2F599A),
                height: double.infinity,
                width: 1.25.w,
              ),
              SizedBox(
                width: 55.w,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.code,
                          style: TextStyle(
                              fontSize: 11.dp, color: Colors.black54)),
                      SizedBox(height: 0.6.h),
                      Text(
                        buildCourseText(course.name),
                        style: TextStyle(
                            fontSize: 13.dp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 0.6.h),
                      Text(
                          "${convertToAmPm(course.startTime)} - ${convertToAmPm(course.endTime)}",
                          style: TextStyle(fontSize: 14, color: Colors.black54))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Room",
                          style: TextStyle(
                              fontSize: 11.dp, color: Colors.black54)),
                      Text(course.room,
                          style: TextStyle(
                              fontSize: 17.dp, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  String convertToAmPm(String time) {
    // Split the time into hours and minutes
    List<String> parts = time.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);

    // Determine if it's AM or PM
    String period = hours >= 12 ? 'PM' : 'AM';

    // Convert hours to 12-hour format
    hours = hours > 12 ? hours - 12 : hours;
    if (hours == 0) {
      hours = 12;
    }

    // Format the time with leading zeros for single-digit hours and minutes
    String formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';

    // Return the time with AM/PM
    return '$formattedTime$period';
  }
}
