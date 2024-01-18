import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.h, left: 5.w, right: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: getGreeting("Khalid"),
                  style:
                      TextStyle(fontSize: 28.dp, fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: 'Khalid',
                  style:
                      TextStyle(fontSize: 28.dp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
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
          SizedBox(height: 2.5.h),
          Container(
            width: double.infinity,
            height: 70.h,
            color: const Color(0xff3347B0),
            child: Padding(
              padding: EdgeInsets.all(12.dp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.school_outlined,
                        color: Colors.white,
                        size: 60.dp,
                      ),
                      TextButton(
                        onPressed: () {
                          print("object");
                        },
                        child: Container(
                          height: 4.h,
                          width: 26.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: const Center(
                            child: Text(
                              'Update Info',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current CGPA",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16.dp,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.dp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Credits Completed",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16.dp,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.dp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 1.h),
                  const Divider(thickness: 1, color: Colors.white),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Personal Info",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16.dp,
                            fontWeight: FontWeight.w300),
                      ),
                      TextButton(
                        onPressed: () {
                          print("object");
                        },
                        child: Container(
                          height: 4.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: const Center(
                            child: Text(
                              'Download Transcript',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Text("Khalid Ibnul  Walid",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.dp,
                          fontWeight: FontWeight.w500)),
                  Text("ID: 2330026",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.dp,
                          fontWeight: FontWeight.w500)),
                  Text("Major: Computer Science",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.dp,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 1.h),
                  const Divider(thickness: 1, color: Colors.white),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Due Payments",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16.dp,
                            fontWeight: FontWeight.w300),
                      ),
                      TextButton(
                        onPressed: () {
                          print("object");
                        },
                        child: Container(
                          height: 4.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: const Center(
                            child: Text(
                              'Download Report',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  // Center(
                  //   child: Column(
                  //     children: [
                  //       Icon(
                  //         Iconsax.tick_square,
                  //         color: Colors.white54,
                  //         size: 40.dp,
                  //       ),
                  //       SizedBox(height: 1.h),
                  //       Text(
                  //           "All payments have safely reached their destination!",
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 14.dp,
                  //               fontWeight: FontWeight.w400)),
                  //     ],
                  //   ),
                  // )
                  CarouselSlider.builder(
                    itemCount: 2,
                    options: CarouselOptions(
                      height: 11.h,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      onPageChanged: (int index, _) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Registration Fee",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.dp,
                                        fontWeight: FontWeight.w400)),
                                Text("Due by 21-Jan-2024",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.dp,
                                        fontWeight: FontWeight.w500)),
                                Text("Spring 2024",
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 14.dp,
                                        fontWeight: FontWeight.w400)),
                              ]),
                          Padding(
                            padding: EdgeInsets.only(top: 0, right: 15.dp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total (TK)	",
                                    style: TextStyle(
                                        fontSize: 11.dp,
                                        color: Colors.white60)),
                                Text("7000",
                                    style: TextStyle(
                                        fontSize: 18.dp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  _buildPageIndicator(2)
                ],
              ),
            ),
          ),
          SizedBox(height: 1.5.h),
          Text(
            'Please press "Update Info" to refresh data from IRAS',
            style: TextStyle(
              fontSize: 11.5.dp,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(int length) {
    List<Widget> list = [];
    for (int i = 0; i < length; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return Container(
      height: 20,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return SizedBox(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        height: 4.0,
        width: isActive ? 16 : 4.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(2)),
          color: isActive ? const Color(0XFFFFFFFF) : const Color(0XFFFFFFFF),
        ),
      ),
    );
  }

  String getGreeting(String name) {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning, ';
    } else if (hour < 17) {
      return 'Good afternoon, ';
    } else {
      return 'Good evening, ';
    }
  }
}
