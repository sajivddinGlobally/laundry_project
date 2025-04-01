import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/constant/colors/myColors.dart';
import 'package:laundry_app/signUp.page/view/otp.page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String selectedOption = "service provider";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/cloths.png"),
              Positioned.fill(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/Group.png",
                        width: 119.w,
                        height: 133.h,
                      ),
                      Text(
                        "Laundry",
                        style: GoogleFonts.kumbhSans(
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 20.w,
                top: 30.h,
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.kumbhSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                    color: buttonColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 50.w),
              Radio(
                activeColor: Color.fromARGB(255, 0, 97, 254),
                value: "Customer",
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOption = "Customer";
                  });
                },
                child: Text(
                  "Customer",
                  style: GoogleFonts.kumbhSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Radio(
                    activeColor: Color.fromARGB(255, 0, 97, 254),
                    value: "Staff",
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = "Staff";
                      });
                    },
                    child: Text(
                      "Staff",
                      style: GoogleFonts.kumbhSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  SizedBox(width: 70.w),
                ],
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 50.w, right: 50.w),
            child: TextFormField(
              // inputFormatters: [
              //   LengthLimitingTextInputFormatter(10), // Maximum 10 digits
              // ],
              maxLength: 10,
              keyboardType: TextInputType.phone,
              style: GoogleFonts.kumbhSans(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              decoration: InputDecoration(
                counterText: '', // hide karne ke liye
                prefixIcon: Icon(Icons.phone_in_talk_outlined),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: buttonColor,
                    width: 1.5.w,
                  ), // Bottom border color when not focused
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: buttonColor,
                  ), // Bottom border color when focused
                ),
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => OtpPage()),
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
                  "sign in",
                  style: GoogleFonts.kumbhSans(
                    fontSize: 24.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
