import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:laundry_app/constant/colors/myColors.dart';
import 'package:laundry_app/home/home.page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [
    LatLng(28.6139, 77.2090), // Point A (Delhi)
    LatLng(28.5355, 77.3910), // Point B (Noida)
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addPolyline();
  }
  void _addPolyline() {
  Polyline polyline = Polyline(
    polylineId: PolylineId("route"),
    color: Colors.blue,
    width: 5,
    points: polylineCoordinates,
  );

  setState(() {
    _polylines.add(polyline);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      appBar: AppBar(backgroundColor: defaultColor, leading: Icon(Icons.menu)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 30.h),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 6.h),
                  width: 98.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 217, 217, 217),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  "USE CURRENT LOCATION?",
                  style: GoogleFonts.kumbhSans(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 2, 79, 100),
                  ),
                ),
                Text(
                  "230 HELIPORT LOOP",
                  style: GoogleFonts.kumbhSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Color.fromARGB(104, 14, 26, 31),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  child: Stack(
                    children: [
                      Divider(
                        indent: 30,
                        endIndent: 30,
                        color: Color.fromARGB(255, 232, 227, 227),
                        thickness: 1.5.w,
                      ),
                      Positioned(
                        left: 60.w,
                        top: 8.h,
                        child: Icon(
                          Icons.subdirectory_arrow_left,
                          color: Color.fromARGB(255, 49, 205, 252),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 30.h,
                      color: Color.fromARGB(104, 14, 24, 31),
                    ),
                    Text(
                      "pick up location",
                      style: GoogleFonts.kumbhSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 24.sp,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  "560 cliffside drive",
                  style: GoogleFonts.kumbhSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: Color.fromARGB(104, 14, 24, 31),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Container(
                  width: 379.w,
                  height: 64.h,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 46.w),
                      Text(
                        "Next",
                        style: GoogleFonts.kumbhSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward, color: Colors.white),
                      SizedBox(width: 46.w),
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
