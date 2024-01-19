import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:iub_students/services/functional/utility_services.dart';

class AcademicScreen extends StatefulWidget {
  const AcademicScreen({super.key});

  @override
  State<AcademicScreen> createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 95.h,
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
                                Text("Feb 24",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24.dp,
                                        fontWeight: FontWeight.bold)),
                                Text("20 Days till Mid-Term",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.dp,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(height: 1.h),
                                const LinearProgressIndicator(
                                  value: 0.7,
                                ),
                                SizedBox(height: 2.h),
                                Text("GPA to Maintain CG",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.dp,
                                        fontWeight: FontWeight.w400)),
                                Text("3.75",
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
                                Text("Upcoming",
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
                                        Text("Mid-Term Exams",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.dp,
                                                fontWeight: FontWeight.w500)),
                                        Text("24 - 25 February",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.dp,
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
                                        Text("Final Exams",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.dp,
                                                fontWeight: FontWeight.w500)),
                                        Text("20 - 25 April",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.dp,
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
              SizedBox(height: 2.h),
              Text(
                "January",
                style: TextStyle(fontSize: 16.dp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 1.h),
              Container(
                clipBehavior: Clip.hardEdge,
                width: double.infinity,
                height: 10.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.1), // Set shadow color here
                      spreadRadius: 5, // Set spread radius of the shadow
                      blurRadius: 7, // Set blur radius of the shadow
                      offset: Offset(0, 3), // Set offset of the shadow
                    ),
                  ],
                  border: Border.all(
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 15.w,
                      child: Center(
                          child: Icon(
                        Iconsax.book_saved_copy,
                        color: Colors.purpleAccent,
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.dp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            UtilityServices.subText(
                                "Course registration for Spring 2024", 30),
                            style: TextStyle(
                                fontSize: 16.dp, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "14 Jan - 16 Jan, 2024",
                            style: TextStyle(
                                fontSize: 14.dp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h),
              Container(
                clipBehavior: Clip.hardEdge,
                width: double.infinity,
                height: 10.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.1), // Set shadow color here
                      spreadRadius: 5, // Set spread radius of the shadow
                      blurRadius: 7, // Set blur radius of the shadow
                      offset: Offset(0, 3), // Set offset of the shadow
                    ),
                  ],
                  border: Border.all(
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 15.w,
                      child: Center(
                          child: Icon(
                        Iconsax.tree_copy,
                        color: Colors.purpleAccent,
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.dp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            UtilityServices.subText("Independence Day", 30),
                            style: TextStyle(
                                fontSize: 16.dp, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "14 Jan - 16 Jan, 2024",
                            style: TextStyle(
                                fontSize: 14.dp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h),
              Container(
                clipBehavior: Clip.hardEdge,
                width: double.infinity,
                height: 10.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.1), // Set shadow color here
                      spreadRadius: 5, // Set spread radius of the shadow
                      blurRadius: 7, // Set blur radius of the shadow
                      offset: Offset(0, 3), // Set offset of the shadow
                    ),
                  ],
                  border: Border.all(
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 15.w,
                      child: Center(
                          child: Icon(
                        Iconsax.book_saved_copy,
                        color: Colors.redAccent,
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.dp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            UtilityServices.subText("Mid-Term Exam", 30),
                            style: TextStyle(
                                fontSize: 16.dp, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "14 Jan - 16 Jan, 2024",
                            style: TextStyle(
                                fontSize: 14.dp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
