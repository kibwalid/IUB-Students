import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:iub_students/models/event.dart';
import 'package:iub_students/models/exam.dart';
import 'package:iub_students/services/functional/utility_services.dart';

class AcademicScreen extends StatefulWidget {
  final List<Exam> exams;
  final Map<String, List<Event>> events;
  final double cgpaNeeded;
  const AcademicScreen(
      {super.key,
      required this.exams,
      required this.events,
      required this.cgpaNeeded});

  @override
  State<AcademicScreen> createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.only(top: 6.h, left: 5.w, right: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 2.5.h),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xff5454E3),
                    borderRadius: BorderRadius.circular(0)),
                width: double.infinity,
                height: 25.h,
                child: Padding(
                    padding: EdgeInsets.all(12.dp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0)),
                          width: 40.w,
                          height: 22.h,
                          child: Padding(
                            padding: EdgeInsets.all(12.dp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(getDateHeader(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24.dp,
                                        fontWeight: FontWeight.bold)),
                                Text(getDateCountdown(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.dp,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(height: 1.h),
                                LinearProgressIndicator(
                                  value: getPercent(),
                                ),
                                SizedBox(height: 2.h),
                                Text("GPA to Increase CG",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.dp,
                                        fontWeight: FontWeight.w400)),
                                Text(widget.cgpaNeeded.toStringAsFixed(2),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24.dp,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40.w,
                          height: 22.h,
                          child: Padding(
                            padding: EdgeInsets.only(top: 2.h, left: 2.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Milestones",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.dp,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(height: 2.h),
                                Row(
                                  children: [
                                    Container(
                                      width: 1.w,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff84B3B8),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    SizedBox(width: 2.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(widget.exams.first.title,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.dp,
                                                fontWeight: FontWeight.w500)),
                                        Text(widget.exams.first.date,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13.dp,
                                                fontWeight: FontWeight.w300)),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                Row(
                                  children: [
                                    Container(
                                      width: 1.w,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffff6666),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    SizedBox(width: 2.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(widget.exams.last.title,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.dp,
                                                fontWeight: FontWeight.w500)),
                                        Text(widget.exams.last.date,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13.dp,
                                                fontWeight: FontWeight.w300)),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(height: 2.h),
              Text(
                "Academic Events",
                style: TextStyle(fontSize: 20.dp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 1.h),
              Container(
                width: 10.w,
                height: 0.6.h,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Column(
                children: generateAcademicEventUI(),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getDateHeader() {
    DateTime date = Exam.findClosestExam(widget.exams).startDate;
    return "${date.day} ${UtilityServices.getMonthInWords(date)}";
  }

  String getDateCountdown() {
    Exam exam = Exam.findClosestExam(widget.exams);
    DateTime date = exam.startDate;
    return "${date.difference(DateTime.now()).inDays} Days till ${exam.title.split(" ").first}";
  }

  double getPercent() {
    Exam exam = Exam.findClosestExam(widget.exams);
    DateTime date = exam.startDate;
    return date.difference(DateTime.now()).inDays / 60;
  }

  List<Widget> generateAcademicEventUI() {
    List<Widget> ui = widget.events.entries
        .map(
          (e) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              Text(
                e.key,
                style: TextStyle(fontSize: 16.dp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 1.h),
              Column(
                children: e.value.map((e) => buildEventCard(e)).toList(),
              ),
              SizedBox(height: 1.h)
            ],
          ),
        )
        .toList();
    ui.add(Column(
      children: [
        SizedBox(
          height: 3.h,
        ),
      ],
    ));
    return ui;
  }

  Widget buildEventCard(Event event) {
    return Padding(
      padding: EdgeInsets.only(
        top: 1.h,
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: double.infinity,
        height: 10.h,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1), // shadow color here
              spreadRadius: 5, // spread radius of the shadow
              blurRadius: 7, // blur radius of the shadow
              offset: const Offset(0, 3), // offset of the shadow
            ),
          ],
          border: Border.all(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 15.w,
              child: Center(
                  child: Icon(
                1 == event.tag.length
                    ? Icons.villa_outlined
                    : Iconsax.book_saved_copy,
                color: 3 == event.tag.length
                    ? Colors.redAccent
                    : Colors.purpleAccent,
              )),
            ),
            Padding(
              padding: EdgeInsets.all(12.dp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    UtilityServices.subText(event.title, 30),
                    style:
                        TextStyle(fontSize: 16.dp, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    event.date,
                    style:
                        TextStyle(fontSize: 14.dp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
