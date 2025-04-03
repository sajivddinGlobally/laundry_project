import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/constant/colors/myColors.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 95.h),
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Row(
              children: [
                SizedBox(width: 50.w),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 2, 79, 100),
                  ),
                ),
                SizedBox(width: 70.w),
                Center(
                  child: Text(
                    "Payment",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                      color: Color.fromARGB(255, 2, 79, 100),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 36.h),
          Padding(
            padding: EdgeInsets.only(left: 27.w),
            child: Text(
              "Payment Method",
              style: GoogleFonts.kumbhSans(
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 3, 145, 196),
              ),
            ),
          ),
          SizedBox(height: 18.h),

          Padding(
            padding: EdgeInsets.only(left: 54.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      activeColor: Color.fromARGB(255, 3, 145, 196),
                      value: selectedOption == "Cash On Delivery",
                      onChanged: (value) {
                        setState(() {
                          selectedOption = "Cash On Delivery";
                        });
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedOption = "Cash On Delivery";
                        });
                      },
                      child: Text(
                        "Cash On Delivery",
                        style: GoogleFonts.kumbhSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 2, 79, 100),
                        ),
                      ),
                    ),
                    SizedBox(width: 70.w),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Color.fromARGB(255, 3, 145, 196),
                      value: selectedOption == "Mobile Banking",
                      onChanged: (value) {
                        setState(() {
                          selectedOption = "Mobile Banking";
                        });
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedOption = "Mobile Banking";
                        });
                      },
                      child: Text(
                        "Mobile Banking",
                        style: GoogleFonts.kumbhSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 2, 79, 100),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 76.h),
          Padding(
            padding: EdgeInsets.only(left: 26.w, right: 26.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardImage(image: "assets/card1.png"),
                CardImage(image: "assets/card2.png"),
                CardImage(image: "assets/card3.png"),
              ],
            ),
          ),
          SizedBox(height: 49.h),
          Divider(
            indent: 40.w,
            endIndent: 40.w,
            color: Color.fromARGB(161, 191, 188, 188),
            thickness: 2.w,
          ),
          SizedBox(height: 27.h),
          Padding(
            padding: EdgeInsets.only(left: 44.w, right: 64.w),
            child: Column(
              children: [
                OrderId(title: "Order Id", subtitle: "P01–1234567"),
                SizedBox(height: 40.h),
                OrderId(title: "Delivery Date", subtitle: "15 June. 2025 "),
                SizedBox(height: 40.h),
                OrderId(title: "Pick Up Address", subtitle: "P01–1234567"),
              ],
            ),
          ),
          SizedBox(height: 50.h),
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
                    "Place Order",
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
    );
  }
}

class OrderId extends StatelessWidget {
  final String title;
  final String subtitle;
  const OrderId({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.kumbhSans(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: Color.fromARGB(255, 2, 79, 100),
          ),
        ),
        Text(
          subtitle,
          style: GoogleFonts.kumbhSans(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: Color.fromARGB(104, 14, 26, 31),
          ),
        ),
      ],
    );
  }
}

class CardImage extends StatefulWidget {
  final String image;
  const CardImage({super.key, required this.image});

  @override
  State<CardImage> createState() => _CardImageState();
}

class _CardImageState extends State<CardImage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 116.5.w,
      height: 85.h,
      child: Image.asset(
        widget.image,
        width: 116.5.w,
        height: 85.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
