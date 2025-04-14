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

// ServicePage.dart

class ServicePage extends ConsumerStatefulWidget {
  const ServicePage({super.key});

  @override
  ConsumerState<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends ConsumerState<ServicePage> {
  int totalAmount = 0;
  List<int> selectedPrices = [];

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeNotifierProvider);

    // Initialize selectedPrices once we have products
    if (selectedPrices.length != (homeState.products?.data.length ?? 0)) {
      selectedPrices = List.filled(homeState.products!.data.length, 0);
    }

    return Scaffold(
      backgroundColor: defaultColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 95.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Text(
                    "Service",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                      color: Colors.black,
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
                  scrollDirection: Axis.horizontal,
                  itemCount: homeState.services?.data.length ?? 0,
                  itemBuilder: (context, index) {
                    final service = homeState.services!.data[index];
                    return Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: Column(
                        children: [
                          Container(
                            width: 71.w,
                            height: 71.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(99, 196, 196, 196),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  "https://rl4km84x-8000.inc1.devtunnels.ms/${service.iconImage}",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            service.title,
                            style: GoogleFonts.kumbhSans(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 22.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _genderButton("Men", Color.fromARGB(255, 49, 205, 252)),
                _genderButton("Women", Color.fromARGB(226, 250, 231, 59)),
              ],
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
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0,
                    blurRadius: 4.r,
                    offset: Offset(2, -3),
                    color: Colors.black26,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 33.w,
                      vertical: 18.h,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Topwear", style: _headerTextStyle()),
                        ),
                        Expanded(
                          child: Text("Price", style: _headerTextStyle()),
                        ),
                        Expanded(
                          child: Text("Subtotal", style: _headerTextStyle()),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 33.w),
                    child: ListView.builder(
                      itemCount: homeState.products?.data.length ?? 0,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final product = homeState.products!.data[index];
                        return YourClothses(
                          name: product.title,
                          amount: product.priceJson[0].price.toInt(),
                          onChanged: (subtotal) {
                            setState(() {
                              selectedPrices[index] = subtotal;
                              totalAmount = selectedPrices.fold(
                                0,
                                (sum, val) => sum + val,
                              );
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.only(left: 33.w),
              child: Row(
                children: [
                  Text("Total: ", style: _headerTextStyle()),
                  Text("₹ $totalAmount", style: _headerTextStyle()),
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

  Widget _genderButton(String title, Color color) {
    return Container(
      width: 166.w,
      height: 92.h,
      color: color,
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.kumbhSans(
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  TextStyle _headerTextStyle() {
    return GoogleFonts.kumbhSans(
      fontWeight: FontWeight.w400,
      fontSize: 20.sp,
      color: Color.fromARGB(255, 2, 79, 100),
    );
  }
}

class YourClothses extends StatefulWidget {
  final String name;
  final int amount;
  final Function(int) onChanged;

  const YourClothses({
    super.key,
    required this.name,
    required this.amount,
    required this.onChanged,
  });

  @override
  State<YourClothses> createState() => _YourClothsesState();
}

class _YourClothsesState extends State<YourClothses> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    int subtotal = widget.amount * count;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Expanded(child: Center(child: Text(widget.name, style: _style()))),
          Expanded(
            child: Center(child: Text("${widget.amount} ₹", style: _style())),
          ),
          CountStepper(
            space: 0,
            iconColor: Color.fromARGB(226, 250, 231, 59),
            iconDecrementColor: Color.fromARGB(255, 49, 205, 252),
            splashRadius: 25,
            defaultValue: 0,
            max: 100,
            min: 0,
            onPressed: (value) {
              setState(() {
                count = value;
              });
              widget.onChanged(widget.amount * count);
            },
          ),
          Expanded(child: Center(child: Text("$subtotal ₹", style: _style()))),
        ],
      ),
    );
  }

  TextStyle _style() {
    return GoogleFonts.kumbhSans(
      fontWeight: FontWeight.w400,
      fontSize: 15.sp,
      color: Colors.black,
    );
  }
}
