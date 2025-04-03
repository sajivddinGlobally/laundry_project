import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/constant/colors/myColors.dart';
import 'package:laundry_app/signUp.page/view/signUp.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Map<String, String>> mylist = [
    {'imageUrl': "assets/landingimage1.png"},
    {'imageUrl': "assets/landingimage2.png"},
    {'imageUrl': "assets/landingimage3.png"},
    {'imageUrl': "assets/landingimage3.png"},
    {'imageUrl': "assets/landingimage4.png"},
    {'imageUrl': "assets/landingimage6.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 350.h,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1.w,
                mainAxisSpacing: 5.h,
              ),
              itemCount: mylist.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Image.asset(
                    mylist[index]["imageUrl"].toString(),
                    width: 181.w,
                    height: 206,
                  ),
                );
              },
            ),
          ),
          Text(
            "Your Iron delivered",
            style: GoogleFonts.kumbhSans(
              fontSize: 32.sp,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h),
            child: Image.asset("assets/image.png"),
          ),
          SizedBox(height: 25.h),
          Center(
            child: SizedBox(
              width: 119.78.w,
              height: 133.08.h,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset("assets/Group.png"),
              ),
            ),
          ),
          Text(
            "Iron",
            style: GoogleFonts.kumbhSans(
              fontWeight: FontWeight.w300,
              fontSize: 36.sp,
              color: buttonColor,
            ),
          ),
          // SizedBox(height: 20.h),
          // Padding(
          //   padding: EdgeInsets.only(left: 30.w, right: 20.w),
          //   child: Row(
          //     children: [
          //       Image.asset("assets/image.png", color: Colors.black),
          //       Spacer(),
          //       Image.asset("assets/image.png", color: Colors.black),
          //       Spacer(),
          //       Image.asset("assets/image.png", color: Colors.black),
          //     ],
          //   ),
          // ),
          SizedBox(height: 50.h),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => SignUp()),
              );
            },
            child: Container(
              width: 351.w,
              height: 55.h,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: Text(
                  "continue",
                  style: GoogleFonts.kumbhSans(
                    fontSize: 24.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
