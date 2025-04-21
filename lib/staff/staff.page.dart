import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/staff/controller/admin.orders.controller.dart';
import 'package:laundry_app/staff/perticulerOrder.page.dart';
import 'package:laundry_app/staff/userlocationMap.page.dart';

class StaffPage extends ConsumerStatefulWidget {
  const StaffPage({super.key});

  @override
  ConsumerState<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends ConsumerState<StaffPage> {
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    final orders = ref.watch(adminOrderProvider);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 251, 251),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 162, 210),
        automaticallyImplyLeading: false,
      ),
      body: orders.when(
        data: (snapshot) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 21.h),

                SizedBox(height: 15.h),

                SizedBox(height: 16.w),
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: Text(
                    "Delivery History",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: Color.fromARGB(255, 44, 62, 80),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                // DeliveryComplete(),
                // SizedBox(height: 20.h),
                // DeliveryComplete(),
                ListView.builder(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 16.w),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => AdminOrderDetailsScreen(orderId: snapshot.data[index].id.oid,)));
                        },
                        child: DeliveryComplete(
                          email: snapshot.data[index].user.email,
                          phoneNumber: snapshot.data[index].user.phone,
                          picked: snapshot.data[index].iroing,
                          delivered: snapshot.data[index].deliverd,
                          pickupTime: snapshot.data[index].pickupSlot,
                          pickupDate: snapshot.data[index].createDate,
                          name: snapshot.data[index].user.name,
                          orderId: snapshot.data[index].orderId,
                          address: snapshot.data[index].address,
                          lat: snapshot.data[index].latitude,
                          long: snapshot.data[index].longitude,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
        error: (err, stack) => Center(child: Text(err.toString())),
        loading:
            () => Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 55, 162, 210),
              ),
            ),
      ),
    );
  }
}

class DeliveryComplete extends StatefulWidget {
  final String name;
  final String orderId;
  final String pickupDate;
  final String pickupTime;
  final bool picked;
  final bool delivered;
  final String address;
  final double lat;
  final double long;
  final String email;
  final String phoneNumber;
  const DeliveryComplete({
    super.key,
    required this.name,
    required this.pickupTime,
    required this.orderId,
    required this.pickupDate,
    required this.picked,
    required this.delivered,
    required this.address,
    required this.lat,
    required this.long,
    required this.email,
    required this.phoneNumber,
  });

  @override
  State<DeliveryComplete> createState() => _DeliveryCompleteState();
}

class _DeliveryCompleteState extends State<DeliveryComplete> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Container(
            width: 382.w,

            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 40.r,
                  spreadRadius: 0,
                  color: Color.fromARGB(25, 0, 0, 0),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${widget.name}",
                        style: GoogleFonts.kumbhSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 44, 62, 80),
                        ),
                      ),
                      Spacer(),
                      // Container(
                      //   width: 83.w,
                      //   // height: 20.h,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(16.r),
                      //     color: Color.fromARGB(255, 55, 162, 210),
                      //   ),
                      //   child: Center(
                      //     child: Text(
                      //       "Complete",
                      //       style: GoogleFonts.openSans(
                      //         fontWeight: FontWeight.w400,
                      //         fontSize: 14.sp,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  Text(
                    "Order ID: #${widget.orderId}",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Color.fromARGB(255, 44, 62, 80),
                    ),
                  ),
                  Text(
                    "${widget.pickupDate}",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Color.fromARGB(255, 126, 124, 124),
                    ),
                  ),
                  Text(
                    "${widget.pickupTime}",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Color.fromARGB(255, 126, 124, 124),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomPaint(
                    size: Size(350.w, 2.w), // Width and height of the line
                    painter: DottedLinePainter(),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Container(
                        width: 15.w,
                        height: 15.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              widget.picked
                                  ? Color.fromARGB(255, 12, 3, 140)
                                  : Colors.white,
                          border: Border.all(
                            color: Color.fromARGB(255, 12, 3, 140),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Picked",
                        style: GoogleFonts.kumbhSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Color.fromARGB(255, 153, 153, 153),
                        ),
                      ),
                      SizedBox(width: 100.w),
                      Row(
                        children: [
                          Container(
                            width: 15.w,
                            height: 15.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // color: Color.fromARGB(255, 12, 3, 140),
                              color:
                                  widget.delivered
                                      ? Color.fromARGB(255, 12, 3, 140)
                                      : Colors.white,
                              border: Border.all(
                                color: Color.fromARGB(255, 12, 3, 140),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "Deliverd",
                            style: GoogleFonts.kumbhSans(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Color.fromARGB(255, 153, 153, 153),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 16.w),
        Padding(
          padding: EdgeInsets.only(left: 25.w),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder:
                      (context) => UserLocationPage(
                        latitude: widget.lat,
                        longitude: widget.long,
                        address: widget.address,
                        name: widget.name,
                        email: widget.email,
                        phone: widget.phoneNumber,
                      ),
                ),
              );
            },
            child: Text(
              "View Location",
              style: GoogleFonts.kumbhSans(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Color.fromARGB(255, 44, 62, 80),
                decoration: TextDecoration.underline,
                decorationColor: Color.fromARGB(255, 44, 62, 80),
                decorationThickness: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class History extends StatefulWidget {
  final String text;
  final Color color;
  const History({super.key, required this.text, required this.color});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 15.w,
          height: 15.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color,
            border: Border.all(color: Color.fromARGB(255, 12, 3, 140)),
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          widget.text,
          style: GoogleFonts.kumbhSans(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            color: Color.fromARGB(255, 153, 153, 153),
          ),
        ),
      ],
    );
  }
}

/// **Custom Painter for Dotted Horizontal Line**
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color =
              Colors
                  .black // Line color
          ..strokeWidth =
              1 // Line thickness
          ..strokeCap = StrokeCap.round; // Rounded ends for dots

    double dashWidth = 5, dashSpace = 5, startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace; // Move to next dash
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
