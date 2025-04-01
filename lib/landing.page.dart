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
    {'imageUrl': "assets/landingimage4.png"},
    {'imageUrl': "assets/landingimage5.png"},
    {'imageUrl': "assets/landingimage6.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h),
            color: Colors.yellow,
            height: 400.h,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.w,
                mainAxisSpacing: 5.h,
              ),
              itemCount: mylist.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Image.asset(
                    mylist[index]["imageUrl"].toString(),
                    width: 181.w,
                    height: 206,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Your Iron delivered",
            style: GoogleFonts.kumbhSans(
              fontSize: 32.sp,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          SizedBox(height: 20.h),
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
