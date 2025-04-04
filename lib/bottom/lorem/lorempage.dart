import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/bottom/lorem/mapview.page.dart';
import 'package:order_tracker/order_tracker.dart';

class LoremPage extends StatefulWidget {
  const LoremPage({super.key});

  @override
  State<LoremPage> createState() => _LorempageState();
}

class _LorempageState extends State<LoremPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 55, 162, 210),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 85.h),
            Center(
              child: Row(
                children: [
                  SizedBox(width: 33.w),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 27.w,
                      height: 27.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.07.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20.sp,
                          color: Color.fromARGB(255, 55, 162, 210),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    "Lorem Ipsum",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.47.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 68.h),
            Row(
              children: [
                SizedBox(width: 65.w),
                Text(
                  "Current",
                  style: GoogleFonts.kumbhSans(
                    fontWeight: FontWeight.w900,
                    fontSize: 20.63.sp,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Container(
                  width: 151.31.w,
                  height: 39.1.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.29.r),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Center(
                    child: Text(
                      "Current",
                      style: GoogleFonts.kumbhSans(
                        fontWeight: FontWeight.w300,
                        fontSize: 20.63.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 33.41.w),
              ],
            ),
            SizedBox(height: 64),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 249, 242),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 70.h),
                  OrderId(),
                  SizedBox(height: 30.h),
                  OrderId(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderId extends StatefulWidget {
  const OrderId({super.key});

  @override
  State<OrderId> createState() => _OrderIdState();
}

class _OrderIdState extends State<OrderId> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => MapViewPage()),
        );
      },
      child: Container(
        width: 362.59.w,
        height: 199.39.h,
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("assets/box.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Order #1234567",
                          style: GoogleFonts.kumbhSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.47.sp,
                            color: Color.fromARGB(255, 55, 162, 210),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "From Lorem Ipsum",
                          style: GoogleFonts.kumbhSans(
                            fontWeight: FontWeight.w300,
                            fontSize: 15.47.sp,
                            color: Color.fromARGB(255, 55, 162, 210),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "To All",
                          style: GoogleFonts.kumbhSans(
                            fontWeight: FontWeight.w300,
                            fontSize: 15.47.sp,
                            color: Color.fromARGB(255, 55, 162, 210),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "10/10/2025-13/10/2025",
                          style: GoogleFonts.kumbhSans(
                            fontWeight: FontWeight.w300,
                            fontSize: 15.47.sp,
                            color: Color.fromARGB(255, 55, 162, 210),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 40.sp,
                    color: Color.fromARGB(255, 55, 162, 210),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Center(
                child: HorizontalOrderTracker(
                  currentStep: 3, // Change this to update progress
                  totalSteps: 5,
                  activeColor: Colors.black,
                  inActiveColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalOrderTracker extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final Color activeColor;
  final Color inActiveColor;

  const HorizontalOrderTracker({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.activeColor,
    required this.inActiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        bool isActive = index < currentStep;
        return Row(
          children: [
            Container(
              width: 8, // smaller width
              height: 8, // smaller height
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? activeColor : inActiveColor,
              ),
            ),
            // Line (Except for last step)
            if (index < totalSteps - 1)
              Container(
                width: 60.w, // Adjust the width for spacing
                height: 1.29.h,
                color: isActive ? activeColor : inActiveColor,
              ),
          ],
        );
      }),
    );
  }
}
