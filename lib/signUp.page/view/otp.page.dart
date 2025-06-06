import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:laundry_app/account/account.page.dart';
import 'package:laundry_app/constant/colors/myColors.dart';
import 'package:laundry_app/googlemap/views/pickup.location.page.dart';
import 'package:laundry_app/home/home.page.dart';
import 'package:laundry_app/payment/controller/productCart.controller.dart';
import 'package:laundry_app/signUp.page/view/signUp.dart';
import 'package:otpify/otpify.dart';

class OtpPage extends ConsumerStatefulWidget {
  final String otpCode;
  const OtpPage({super.key, required this.otpCode});

  @override
  ConsumerState<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage> {
  @override
  Widget build(BuildContext context) {
    final orderState = ref.watch(orderCreateProvider);
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
                width: 60.w,
                height: 60.w,
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
                resendText: '',
                resendAlignment: ResendAlignment.end,
                resendFontWeight: FontWeight.normal,
                onChanged: (value) {},
                onCompleted: (value) {
                  if (value == widget.otpCode) {
                    if (orderState == null) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(builder: (context) => HomePage()),
                        (route) => false,
                      );
                    } else {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => LocationPickerPage(),
                        ),
                        (route) => false,
                      );
                    }
                  } else {
                    var box = Hive.box("data");
                    box.clear();
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => SignUp()),
                    );
                    log("Invalid OTP code");
                    Fluttertoast.showToast(msg: "Invalid OTP code");
                  }
                },
                onResend: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
