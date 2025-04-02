import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:laundry_app/account/edit.page.dart';
import 'package:laundry_app/constant/colors/myColors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80.h),
          Row(
            children: [
              SizedBox(width: 35.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Personal details",
                    style: GoogleFonts.kumbhSans(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 2, 79, 100),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    "Personal information",
                    style: GoogleFonts.kumbhSans(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 2, 79, 100),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                width: 58.85.w,
                height: 58.85.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 217, 217, 217),
                  image: DecorationImage(image: AssetImage("assets/girl.png")),
                ),
              ),
              SizedBox(width: 41.w),
            ],
          ),
          SizedBox(height: 46.h),
          Padding(
            padding: EdgeInsets.only(left: 23.w, right: 23.w),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => EditPage()),
                  );
                },
                child: Container(
                  width: 384.w,
                  height: 49.h,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Text(
                      "Edit Profile",
                      style: GoogleFonts.kumbhSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 35.w, top: 25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: GoogleFonts.kumbhSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Color.fromARGB(183, 30, 30, 30),
                  ),
                ),
                SizedBox(height: 17.h),
                Text(
                  "Linda Silth",
                  style: GoogleFonts.kumbhSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Color.fromARGB(255, 30, 30, 30),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 35.w, right: 35.w, top: 25.h),
            child: Row(
              children: [
                Image.asset("assets/flag.png"),
                Spacer(),
                Text(
                  "+91 9642854965",
                  style: GoogleFonts.kumbhSans(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                SizedBox(width: 30.w),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 40.w, right: 35.w),
            child: Row(
              children: [
                Text(
                  "Location",
                  style: GoogleFonts.kumbhSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Color.fromARGB(183, 30, 30, 30),
                  ),
                ),
                SizedBox(width: 19.w),
                SizedBox(
                  width: 193.w,
                  child: Text(
                    "Gunnersbury House 1 Chapel Hill,london",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Color.fromARGB(255, 30, 30, 30),
                    ),
                  ),
                ),
                SizedBox(width: 19.w),
                Icon(
                  Icons.location_on,
                  color: Color.fromARGB(255, 3, 145, 196),
                  size: 30.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
