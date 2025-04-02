import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      backgroundColor: defaultColor,
      appBar: AppBar(backgroundColor: defaultColor, leading: Icon(Icons.menu)),
      body: Column(
        children: [
          SizedBox(height: 34.h),
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
        ],
      ),
    );
  }
}
