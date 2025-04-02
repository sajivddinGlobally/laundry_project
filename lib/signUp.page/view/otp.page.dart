import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/constant/colors/myColors.dart';
import 'package:otpify/otpify.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      appBar: AppBar(
        backgroundColor: defaultColor,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 31, 18, 22),
            size: 25.sp,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Text(
              "Enter Verification Code",
              style: GoogleFonts.lexend(
                fontSize: 27.55.sp,
                color: Color.fromARGB(255, 31, 18, 22),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Text(
              "Please enter your code continue",
              style: GoogleFonts.lexend(
                fontSize: 16.07.sp,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 31, 18, 22),
              ),
            ),
          ),
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Center(
              child: Otpify(
                fields: 4,
                resendSecond: 10,
                width: 57.39.w,
                height: 56.96.h,
                borderRadius: BorderRadius.circular(50.r),
                fieldColor: buttonColor,
                borderColor: Colors.white,
                focusedBorderColor: buttonColor,
                fieldTextColor: Colors.white,
                fieldTextStyle: GoogleFonts.openSans(
                  fontSize: 25.25.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                resendFontSize: 17.sp,
                resendText: 'Resent it',
                resendAlignment: ResendAlignment.end,
                resendFontWeight: FontWeight.normal,
                onChanged: (value) {},
                onCompleted: (value) {},
                onResend: () {},
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  
                });
              },
              child: Container(
                width: 384.51.w,
                height: 64.28.h,
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
          ),
        ],
      ),
    );
  }
}
