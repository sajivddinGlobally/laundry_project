import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffPage extends StatefulWidget {
  const StaffPage({super.key});

  @override
  State<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 162, 210),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 21.h),
          Row(
            children: [
              SizedBox(width: 25.w),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromARGB(191, 0, 0, 0),
                ),
              ),
              Text(
                "Order history",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: Color.fromARGB(255, 44, 62, 80),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
