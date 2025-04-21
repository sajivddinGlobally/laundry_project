import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:laundry_app/bottom/lorem/controller/ordersProvider.controller.dart';
import 'package:laundry_app/bottom/lorem/mapview.page.dart';
import 'package:laundry_app/bottom/lorem/qrcode.page.dart';
import 'package:laundry_app/staff/staff.page.dart';
import 'package:order_tracker/order_tracker.dart';

class LoremPage extends ConsumerStatefulWidget {
  const LoremPage({super.key});

  @override
  ConsumerState<LoremPage> createState() => _LorempageState();
}

class _LorempageState extends ConsumerState<LoremPage> {
  @override
  Widget build(BuildContext context) {
    final orderProvider = ref.watch(userOrdersProvider);
    var box = Hive.box("data");
    var staff = box.get("staff");
    return staff == true && staff != null? StaffPage() : Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center(
            //   child: Row(
            //     children: [
            //       SizedBox(width: 33.w),
            //       GestureDetector(
            //         onTap: () {
            //           Navigator.pop(context);
            //         },
            //         child: Container(
            //           width: 27.w,
            //           height: 27.h,
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(6.07.r),
            //           ),
            //           child: Padding(
            //             padding: EdgeInsets.only(left: 8.w),
            //             child: Icon(
            //               Icons.arrow_back_ios,
            //               size: 20.sp,
            //               color: Color.fromARGB(255, 55, 162, 210),
            //             ),
            //           ),
            //         ),
            //       ),
            //       SizedBox(width: 15.w),
            //       Text(
            //         "Lorem Ipsum",
            //         style: GoogleFonts.kumbhSans(
            //           fontWeight: FontWeight.w600,
            //           fontSize: 15.47.sp,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              color: Color.fromARGB(255, 55, 162, 210),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 85.h),
                  SizedBox(height: 68.h),
                  Row(
                    children: [
                      SizedBox(width: 65.w),
                      Text(
                        "Orders",
                        style: GoogleFonts.kumbhSans(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.63.sp,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),

                      SizedBox(width: 33.41.w),
                    ],
                  ),
                  SizedBox(height: 64),
                ],
              ),
            ),

            Container(
              color: Colors.white,
              child: orderProvider.when(
                data: (data) {
                  return data.data.length == 0
                      ? Center(
                        child: Text(
                          "No Orders Found",
                          style: GoogleFonts.kumbhSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.47.sp,
                            color: Color.fromARGB(255, 55, 162, 210),
                          ),
                        ),
                      )
                      : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: OrderId(
                              deliverd: data.data[index].deliverd,
                              picked: data.data[index].iroing,
                              orderId: data.data[index].orderId,
                              id: data.data[index].id.oid,
                              createDate: data.data[index].createDate,
                              deliveryDate: data.data[index].deliveryDate,
                              qrcode: data.data[index].qrcodePath,
                            ),
                          );
                        },
                      );
                },
                error: (error, stackTrace) {
                  return Center(child: Text("Error fetching orders"));
                },
                loading:
                    () => SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Center(child: CircularProgressIndicator()),
                    ),
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

class OrderId extends StatefulWidget {
  final String orderId;
  final String id;
  final String createDate;
  final String deliveryDate;
  final bool deliverd;
  final bool picked;
  final String qrcode;
  const OrderId({
    super.key,
    required this.orderId,
    required this.id,
    required this.createDate,
    required this.deliveryDate,
    required this.deliverd,
    required this.picked,
    required this.qrcode,
  });

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
          CupertinoPageRoute(builder: (context) => QrCodePage(qrImageUrl: widget.qrcode,)),
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
                          "Order #${widget.orderId}",
                          style: GoogleFonts.kumbhSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.47.sp,
                            color: Color.fromARGB(255, 55, 162, 210),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "Order Picked: ${widget.picked ? "Yes" : "No"}",
                          style: GoogleFonts.kumbhSans(
                            fontWeight: FontWeight.w300,
                            fontSize: 15.47.sp,
                            color: Color.fromARGB(255, 55, 162, 210),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "Order Delivered: ${widget.deliverd ? "Yes" : "No"}",
                          style: GoogleFonts.kumbhSans(
                            fontWeight: FontWeight.w300,
                            fontSize: 15.47.sp,
                            color: Color.fromARGB(255, 55, 162, 210),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        // Text(
                        //   "${widget.createDate}-${widget.deliveryDate}",
                        //   style: GoogleFonts.kumbhSans(
                        //     fontWeight: FontWeight.w300,
                        //     fontSize: 15.47.sp,
                        //     color: Color.fromARGB(255, 55, 162, 210),
                        //   ),
                        // ),
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
              SizedBox(
                height: 15.h
              ),
              Text(
                "Pickup Date: ${widget.createDate}",
                style: GoogleFonts.kumbhSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 15.47.sp,
                  color: Color.fromARGB(255, 55, 162, 210),
                ),
              ),
              Text(
                "Delivery Date: ${widget.deliveryDate}",
                style: GoogleFonts.kumbhSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 15.47.sp,
                  color: Color.fromARGB(255, 55, 162, 210),
                ),
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
