import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/constant/colors/myColors.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 95.h),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Row(
                children: [
                  Text(
                    "Service",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See All",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      color: buttonColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 22.h),
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 71.24.w,
                        height: 71.24.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(99, 196, 196, 196),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/Clothes.png"),
                          ),
                        ),
                      ),
                      Text(
                        "Iron",
                        style: GoogleFonts.kumbhSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    children: [
                      Container(
                        width: 71.24.w,
                        height: 71.24.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(99, 196, 196, 196),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 10.w),
                            child: Image.asset("assets/irn.png"),
                          ),
                        ),
                      ),
                      Text(
                        "Iron Only",
                        style: GoogleFonts.kumbhSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 22.h),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 166.w,
                    height: 92.h,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 49, 205, 252),
                    ),
                    child: Center(
                      child: Text(
                        "Men",
                        style: GoogleFonts.kumbhSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 166.w,
                    height: 92.h,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(226, 250, 231, 59),
                    ),
                    child: Center(
                      child: Text(
                        "Women",
                        style: GoogleFonts.kumbhSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 44.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                "Select Your Clothes",
                style: GoogleFonts.kumbhSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 24.sp,
                  color: Color.fromARGB(255, 2, 79, 100),
                ),
              ),
            ),
            SizedBox(height: 25.h),
            Container(
              width: 422.w,
              height: 308.h,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0,
                    blurRadius: 4.r,
                    offset: Offset(2, -3),
                    color: Color.fromARGB(63, 0, 0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 33.w,
                      top: 18.h,
                      right: 33.w,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Topwear",
                          style: GoogleFonts.kumbhSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp,
                            color: Color.fromARGB(255, 2, 79, 100),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Price",
                          style: GoogleFonts.kumbhSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp,
                            color: Color.fromARGB(255, 2, 79, 100),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 30.sp,
                          color: Color.fromARGB(255, 2, 79, 100),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Column(
                      children: [
                        YourClothses(),
                        SizedBox(height: 16.h),
                        YourClothses(),
                        SizedBox(height: 16.h),
                        YourClothses(),
                        // SizedBox(height: 16.h),
                        // YourClothses(),
                        // SizedBox(height: 16.h),
                        // YourClothses(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 23.h),
            Center(
              child: Container(
                width: 334.w,
                height: 68.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: buttonColor,
                ),
                child: Center(
                  child: Text(
                    "Make Payment",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
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

class YourClothses extends StatefulWidget {
  const YourClothses({super.key});

  @override
  State<YourClothses> createState() => _YourClothsesState();
}

class _YourClothsesState extends State<YourClothses> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Casual Shirt",
          style: GoogleFonts.kumbhSans(
            fontWeight: FontWeight.w400,
            fontSize: 20.sp,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        Spacer(),
        Text(
          "40 ₹ ",
          style: GoogleFonts.kumbhSans(
            fontWeight: FontWeight.w400,
            fontSize: 20.sp,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        Spacer(),
        CountStepper(
          space: 0,
          iconColor: Color.fromARGB(226, 250, 231, 59),
          defaultValue: 2,
          max: 10,
          min: 0,
          iconDecrementColor: Color.fromARGB(255, 49, 205, 252),
          iconDecrement: Icon(Icons.minimize, color: Colors.black),
          splashRadius: 25,
          onPressed: (value) {},
        ),
      ],
    );
  }
}
