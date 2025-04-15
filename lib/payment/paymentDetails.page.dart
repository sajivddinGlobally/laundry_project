import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/constant/colors/myColors.dart';
import 'package:laundry_app/home/home.page.dart';
import 'package:laundry_app/payment/controller/productCart.controller.dart';
import 'package:laundry_app/payment/controller/slot.controller.dart';
import 'package:laundry_app/payment/model/slot.model.dart';
import 'package:laundry_app/payment/payment.page.dart';

class PaymentdetailsPage extends ConsumerStatefulWidget {
  const PaymentdetailsPage({super.key});

  @override
  ConsumerState<PaymentdetailsPage> createState() => _PaymentdetailsPageState();
}

class _PaymentdetailsPageState extends ConsumerState<PaymentdetailsPage> {
  String selectedOptions = "service provider";
  @override
  Widget build(BuildContext context) {
    final order = ref.watch(orderCreateProvider);
    final slots = ref.watch(slotProvider);
    return Scaffold(
      backgroundColor: defaultColor,
      body: slots.when(
        data: (snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 95.h),
              Row(
                children: [
                  SizedBox(width: 21.w),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(255, 2, 79, 100),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Order Detail",
                    style: GoogleFonts.kumbhSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                      color: Color.fromARGB(255, 2, 79, 100),
                    ),
                  ),
                  SizedBox(width: 77.w),
                ],
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Iron",
                    style: GoogleFonts.kumbhSans(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 3, 145, 196),
                    ),
                  ),
                  SizedBox(width: 48.w),
                  Text(
                    " ₹ ${order!.totalBookedAmount}",
                    style: GoogleFonts.kumbhSans(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 2, 79, 100),
                    ),
                  ),
                  SizedBox(width: 77.w),
                ],
              ),
              SizedBox(height: 32.h),
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
                    SizedBox(height: 40.h),
                    OrderId(title: "Pickup Slot", subtitle: ""),
                    PickupSlotDropdown(allSlots: snapshot.data),
                    SizedBox(height: 40.h),
                    OrderId(title: "Drop Slot", subtitle: ""),
                    DropSlotDeopDown(allSlots: snapshot.data),
                  ],
                ),
              ),
              SizedBox(height: 34.h),
              // Padding(
              //   padding: EdgeInsets.only(left: 18.w, right: 18.w),
              //   child: ExpansionTile(
              //     iconColor: Color.fromARGB(255, 3, 145, 196),
              //     title: Text(
              //       "Order Status",
              //       style: GoogleFonts.kumbhSans(
              //         fontSize: 32.sp,
              //         fontWeight: FontWeight.w600,
              //         color: Color.fromARGB(255, 3, 145, 196),
              //       ),
              //     ),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.vertical(
              //         top: Radius.circular(0),
              //         bottom: Radius.circular(8),
              //       ),
              //     ),
              //     children: [
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             children: [
              //               Radio(
              //                 activeColor: Color.fromARGB(226, 230, 208, 5),
              //                 value: "Linder Processing",
              //                 groupValue: selectedOptions,
              //                 onChanged: (value) {
              //                   setState(() {
              //                     selectedOptions = value!;
              //                   });
              //                 },
              //               ),
              //               GestureDetector(
              //                 onTap: () {
              //                   setState(() {
              //                     selectedOptions = "Linder Processing";
              //                   });
              //                 },
              //                 child: Text(
              //                   "Linder Processing",
              //                   style: GoogleFonts.kumbhSans(
              //                     fontWeight: FontWeight.w600,
              //                     fontSize: 20.sp,
              //                     color: Color.fromARGB(255, 3, 145, 196),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //           Row(
              //             children: [
              //               Radio(
              //                 activeColor: Color.fromARGB(226, 230, 208, 5),
              //                 value: "Delivred",
              //                 groupValue: selectedOptions,
              //                 onChanged: (value) {
              //                   setState(() {
              //                     selectedOptions = value!;
              //                   });
              //                 },
              //               ),
              //               GestureDetector(
              //                 onTap: () {
              //                   setState(() {
              //                     selectedOptions = "Delivred";
              //                   });
              //                 },
              //                 child: Text(
              //                   "Delivred",
              //                   style: GoogleFonts.kumbhSans(
              //                     fontWeight: FontWeight.w600,
              //                     fontSize: 20.sp,
              //                     color: Color.fromARGB(255, 3, 145, 196),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //           Padding(
              //             padding: EdgeInsets.only(left: 10.w, top: 10.h),
              //             child: Text(
              //               "Payment Status",
              //               style: GoogleFonts.kumbhSans(
              //                 fontSize: 32.sp,
              //                 fontWeight: FontWeight.w600,
              //                 color: Color.fromARGB(255, 3, 145, 196),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 70.h),
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: "Order Placed Successfully");
                  Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(builder: (context) => HomePage()),
                    (route) => false,
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
          );
        },
        error: (err, stack) {
          return Center(child: Text(err.toString()));
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class PickupSlotDropdown extends ConsumerStatefulWidget {
  final List<Datum> allSlots;

  const PickupSlotDropdown({Key? key, required this.allSlots})
    : super(key: key);

  @override
  ConsumerState<PickupSlotDropdown> createState() => _PickupSlotDropdownState();
}

class _PickupSlotDropdownState extends ConsumerState<PickupSlotDropdown> {
  Datum? selectedSlot;

  @override
  Widget build(BuildContext context) {
    // Filter only pickup slots
    List<Datum> pickupSlots =
        widget.allSlots.where((slot) => slot.pickup).toList();

    return DropdownButton<Datum>(
      hint: Text("Select Pickup Slot"),
      value: selectedSlot,
      onChanged: (Datum? newValue) {
        setState(() {
          selectedSlot = newValue;
        });
        ref
            .read(orderCreateProvider.notifier)
            .updatePickupSlot(newValue!.startTime);
      },
      isExpanded: true,
      items:
          pickupSlots.map((Datum slot) {
            return DropdownMenuItem<Datum>(
              value: slot,
              child: Text("${slot.startTime} - ${slot.endtime}"),
            );
          }).toList(),
    );
  }
}

class DropSlotDeopDown extends ConsumerStatefulWidget {
  final List<Datum> allSlots;

  const DropSlotDeopDown({Key? key, required this.allSlots}) : super(key: key);

  @override
  ConsumerState<DropSlotDeopDown> createState() => _DropSlotDeopDownState();
}

class _DropSlotDeopDownState extends ConsumerState<DropSlotDeopDown> {
  Datum? selectedSlot;

  @override
  Widget build(BuildContext context) {
    // Filter only pickup slots
    List<Datum> pickupSlots =
        widget.allSlots.where((slot) => slot.pickup == false).toList();

    return DropdownButton<Datum>(
      hint: Text("Select Drop Slot"),
      value: selectedSlot,
      onChanged: (Datum? newValue) {
        setState(() {
          selectedSlot = newValue;
        });
        ref
            .read(orderCreateProvider.notifier)
            .updateDeliverySlot(newValue!.startTime);
      },
      isExpanded: true,
      items:
          pickupSlots.map((Datum slot) {
            return DropdownMenuItem<Datum>(
              value: slot,
              child: Text("${slot.startTime} - ${slot.endtime}"),
            );
          }).toList(),
    );
  }
}
