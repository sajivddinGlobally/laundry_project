import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/constant/colors/myColors.dart';
import 'package:laundry_app/home/controller/home.page.controller.dart';
import 'package:laundry_app/payment/payment.page.dart';

class ServicePage extends ConsumerStatefulWidget {
  const ServicePage({super.key});

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends ConsumerState<ServicePage> {
  int totalAmount = 0;
  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeNotifierProvider);
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
            SizedBox(
              height: 100.h,
              child: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: homeState.services!.data.length,
                  itemBuilder: (context, index) {
                    return Column(
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
                              child: Image.network(
                                "https://rl4km84x-8000.inc1.devtunnels.ms/${homeState.services!.data[index].iconImage}",
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "${homeState.services!.data[index].title}",
                          style: GoogleFonts.kumbhSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    );
                  },
                ),
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
              // height: 308.h,
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

                        Text(
                          "Subtotal",
                          style: GoogleFonts.kumbhSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp,
                            color: Color.fromARGB(255, 2, 79, 100),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.only(left: 33.w, right: 33.w),
                    child: ListView.builder(
                      itemCount: homeState.products!.data.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return YourClothses(
                          name: homeState.products!.data[index].title,
                          ammount:
                              homeState.products!.data[index].priceJson[0].price
                                  .toString() +
                              " ₹ ",
                          callBack: (value) {
                            setState(() {
                           
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 33.w),
                  Text(
                    "Total: ",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Color.fromARGB(255, 2, 79, 100),
                    ),
                  ),
                  Text(
                    "₹ $totalAmount",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Color.fromARGB(255, 2, 79, 100),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 23.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => PaymentPage()),
                );
              },
              child: Center(
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
            ),
          ],
        ),
      ),
    );
  }
}

class YourClothses extends StatefulWidget {
  final String name;
  final String ammount;
  final Function callBack;

  const YourClothses({
    super.key,
    required this.name,
    required this.ammount,
    required this.callBack,
  });

  @override
  State<YourClothses> createState() => _YourClothsesState();
}

class _YourClothsesState extends State<YourClothses> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Center(
            child: Text(
              widget.name,
              style: GoogleFonts.kumbhSans(
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ),
        Spacer(),

        Expanded(
          child: Center(
            child: Text(
              widget.ammount,
              style: GoogleFonts.kumbhSans(
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ),

        CountStepper(
          space: 0,
          iconColor: Color.fromARGB(226, 250, 231, 59),
          defaultValue: 0,
          max: 100,
          min: 0,
          iconDecrementColor: Color.fromARGB(255, 49, 205, 252),
          splashRadius: 25,
          onPressed: (value) {
            setState(() {
              count = value;
            });
            widget.callBack(double.parse(widget.ammount.split(".")[0]) * count);
          },
        ),

        Expanded(
          child: Center(
            child: Text(
              "${double.parse(widget.ammount.split(".")[0]) * count} ₹",
              style: GoogleFonts.kumbhSans(
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
