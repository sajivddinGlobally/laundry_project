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
            SizedBox(height: 46.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lorem(
                  color: Color.fromARGB(255, 55, 162, 210),
                  imageColor: Colors.white,
                  loremColor: Colors.white,
                  rupeColor: Colors.white,
                ),
                SizedBox(width: 80.w),
                Lorem(
                  color: Colors.white,
                  imageColor: Color.fromARGB(255, 55, 162, 210),
                  loremColor: Color.fromARGB(255, 55, 162, 210),
                  rupeColor: Color.fromARGB(255, 55, 162, 210),
                ),
              ],
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}

class Lorem extends StatefulWidget {
  final Color color;
  final Color imageColor;
  final Color loremColor;
  final Color rupeColor;
  const Lorem({
    super.key,
    required this.color,
    required this.imageColor,
    required this.loremColor,
    required this.rupeColor,
  });

  @override
  State<Lorem> createState() => _LoremState();
}

class _LoremState extends State<Lorem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124.72.w,
      height: 166.26..h,
      decoration: BoxDecoration(color: widget.color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/box.png", color: widget.imageColor),
          SizedBox(height: 10.h),
          Text(
            "Lorem",
            style: GoogleFonts.kumbhSans(
              fontWeight: FontWeight.w900,
              fontSize: 16.76.sp,
              color: widget.loremColor,
            ),
          ),
          Text(
            "₹14.20",
            style: GoogleFonts.kumbhSans(
              fontWeight: FontWeight.w900,
              fontSize: 27.sp,
              color: widget.rupeColor,
            ),
          ),
        ],
      ),
    );
  }
}
