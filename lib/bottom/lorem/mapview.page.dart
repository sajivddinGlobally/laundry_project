import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/bottom/location.page.dart';

class MapViewPage extends StatefulWidget {
  const MapViewPage({super.key});

  @override
  State<MapViewPage> createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 162, 210),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset("assets/locationimage.png"),
                Positioned(
                  right: 110.w,
                  top: 40.h,
                  child: Image.asset(
                    "assets/location.png",
                    width: 310.w,
                    height: 310.h,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 42.w, right: 42.w, top: 30.h),
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
          ],
        ),
      ),
    );
  }
}
