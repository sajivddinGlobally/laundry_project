import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/bottom/lorem/lorempage.dart';
import 'package:laundry_app/constant/colors/myColors.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 55, 162, 210),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 85.h),
            Center(
              child: Row(
                children: [
                  SizedBox(width: 33.w),
                  Container(
                    width: 27.w,
                    height: 27.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.07.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Icon(Icons.arrow_back_ios, size: 20.sp),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    "Lorem Ipsum",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.47.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 45.w, right: 45.w, top: 57.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 49.72.w,
                    height: 49.72.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "1",
                        style: GoogleFonts.kumbhSans(
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 76, 0, 46),
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 70.w,
                    height: 0.86.h,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  Container(
                    width: 49.72.w,
                    height: 49.72.h,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "2",
                        style: GoogleFonts.kumbhSans(
                          fontWeight: FontWeight.w900,
                          // color: Color.fromARGB(255, 76, 0, 46),
                          color: Colors.white,
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 70.w,
                    height: 0.86.h,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  Container(
                    width: 49.72.w,
                    height: 49.72.h,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "3",
                        style: GoogleFonts.kumbhSans(
                          fontWeight: FontWeight.w900,
                          // color: Color.fromARGB(255, 76, 0, 46),
                          color: Colors.white,
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [MytxtField(), MytxtField(), MytxtField()],
              ),
            ),
            SizedBox(height: 41.h),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 249, 242),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(19.77.r),
                  topRight: Radius.circular(19.77.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 42.w,
                      right: 42.w,
                      top: 30.h,
                    ),
                    child: Container(
                      width: 343.73.w,
                      height: 35.67,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.59.r),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 12.w,
                                  height: 12.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 55, 162, 210),
                                  ),
                                ),
                                Container(
                                  width: 2.w,
                                  height: 13.h,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 55, 162, 210),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and",
                              style: GoogleFonts.kumbhSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 11.74.sp,
                                color: Color.fromARGB(255, 76, 0, 46),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 55.w),
                      CustomPaint(
                        size: Size(3.w, 50.h), // Width x Height
                        painter: DottedLinePainter(),
                      ),
                      SizedBox(width: 130.w),
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 55, 162, 210),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_upward_outlined,
                              size: 25.sp,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.arrow_downward,
                              size: 25.sp,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 42.w, right: 42.w),
                    child: Container(
                      width: 343.73.w,
                      height: 35.67,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.59.r),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 20.sp,
                              color: Color.fromARGB(255, 55, 162, 210),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and",
                              style: GoogleFonts.kumbhSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 11.74.sp,
                                color: Color.fromARGB(255, 76, 0, 46),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 70.h),
                  Row(
                    children: [
                      SizedBox(width: 47.w),
                      Text(
                        "Lorem Ipsum Dollar",
                        style: GoogleFonts.kumbhSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.76.sp,
                          color: Color.fromARGB(255, 76, 0, 46),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 38.h),
                  AccountField(name: "Lorem Name", icon: Icons.person),
                  SizedBox(height: 40.h),
                  AccountField(name: "Lorem Number", icon: Icons.call),
                  SizedBox(height: 52.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => LoremPage()),
                      );
                    },
                    child: Center(
                      child: Container(
                        width: 216.87.w,
                        height: 45.55.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.59.r),
                          color: Color.fromARGB(255, 55, 162, 210),
                        ),
                        child: Center(
                          child: Text(
                            "Lorem Ipsum",
                            style: GoogleFonts.kumbhSans(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
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

class AccountField extends StatelessWidget {
  final String name;
  final IconData icon;
  const AccountField({super.key, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 45.w, right: 45.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                // Icons.person,
                icon,
                color: Color.fromARGB(255, 55, 162, 210),
                size: 32.sp,
              ),
              SizedBox(width: 25.w),
              Text(
                // "Lorem Name",
                name,
                style: GoogleFonts.kumbhSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 20.63.sp,
                  color: Color.fromARGB(255, 76, 0, 46),
                ),
              ),
            ],
          ),
          Divider(color: Colors.black),
        ],
      ),
    );
  }
}

/// **Custom Painter for Dotted Vertical Line**
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color =
              Colors
                  .black // लाइन का रंग
          ..strokeWidth =
              1
                  .w // मोटाई
          ..strokeCap = StrokeCap.round; // गोल डॉट्स के लिए

    double dashHeight = 5, dashSpace = 5, startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace; // डैश के बाद स्पेस छोड़ना
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MytxtField extends StatelessWidget {
  const MytxtField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 94.72.w,
      child: Text(
        "Lorem Ipsum is simply dummy text of the printing and",
        style: GoogleFonts.kumbhSans(
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
