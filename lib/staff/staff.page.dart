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
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 251, 251),
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
              SizedBox(width: 80.w),
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
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: Container(
              width: 382.w,
              height: 160.h,
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
                          "6 Quantity of clothes",
                          style: GoogleFonts.kumbhSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                            color: Color.fromARGB(255, 44, 62, 80),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 83.w,
                          // height: 20.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Color.fromARGB(51, 83, 192, 113),
                          ),
                          child: Center(
                            child: Text(
                              "Ongoing",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: Color.fromARGB(255, 3, 150, 44),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Order ID; #1020",
                      style: GoogleFonts.kumbhSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Color.fromARGB(255, 44, 62, 80),
                      ),
                    ),
                    Text(
                      "3rd June,24 ",
                      style: GoogleFonts.kumbhSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: Color.fromARGB(255, 126, 124, 124),
                      ),
                    ),
                    Text(
                      "12:00pm",
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
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              tab = 1;
                            });
                          },
                          child: History(
                            text: "Ironing",
                            color:
                                tab == 1
                                    ? Color.fromARGB(255, 12, 3, 140)
                                    : Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        SizedBox(width: 100.w),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              tab = 2;
                            });
                          },
                          child: History(
                            text: 'Delivery',
                            color:
                                tab == 2
                                    ? Color.fromARGB(255, 12, 3, 140)
                                    : Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16.w),
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Text(
              "View status",
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
          SizedBox(height: 20.h),
          DeliveryComplete(),
          SizedBox(height: 20.h),
          DeliveryComplete(),
        ],
      ),
    );
  }
}

class DeliveryComplete extends StatefulWidget {
  const DeliveryComplete({super.key});

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
            height: 160.h,
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
                        "6 Quantity of clothes",
                        style: GoogleFonts.kumbhSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 44, 62, 80),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 83.w,
                        // height: 20.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Color.fromARGB(255, 55, 162, 210),
                        ),
                        child: Center(
                          child: Text(
                            "Complete",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Order ID; #1020",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Color.fromARGB(255, 44, 62, 80),
                    ),
                  ),
                  Text(
                    "3rd June,24 ",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Color.fromARGB(255, 126, 124, 124),
                    ),
                  ),
                  Text(
                    "12:00pm",
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
                          color: Color.fromARGB(255, 12, 3, 140),
                          border: Border.all(
                            color: Color.fromARGB(255, 12, 3, 140),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Ironly",
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
                              color: Color.fromARGB(255, 12, 3, 140),
                              border: Border.all(
                                color: Color.fromARGB(255, 12, 3, 140),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "Delivery",
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
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 16.w),
        Padding(
          padding: EdgeInsets.only(left: 25.w),
          child: Text(
            "View status",
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
