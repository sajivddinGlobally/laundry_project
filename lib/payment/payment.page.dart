import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:laundry_app/config/pretty.dio.dart';
import 'package:laundry_app/constant/colors/myColors.dart';
import 'package:laundry_app/home/home.page.dart';
import 'package:laundry_app/payment/controller/productCart.controller.dart';
import 'package:laundry_app/payment/paymentDetails.page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:laundry_app/payment/service/createOrder.service.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage extends ConsumerStatefulWidget {
  const PaymentPage({super.key});

  @override
  ConsumerState<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends ConsumerState<PaymentPage> {
  String? selectedOption;
  String currentAddress = 'Getting location...';
  bool loder = false;
  late Razorpay _razorpay;
  String? paymentId;
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    fetchAddress();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    debugPrint("SUCCESS: ${response.paymentId}");
    ref.read(orderCreateProvider.notifier).updateTrnx("${response.paymentId}");
    final order = ref.watch(orderCreateProvider);
    final service = OrderService(createDio());
    OrderCreateResponse orderResponse = await service.createOrder(order!);
    if (orderResponse.message == "Order added") {
      Fluttertoast.showToast(msg: "Order Placed Successfully");
      Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => HomePage()),
        (route) => false,
      );
    } else {
      Fluttertoast.showToast(msg: orderResponse.message);
    }
    // You can verify this payment on your backend
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    debugPrint("ERROR: ${response.code} | ${response.message}");
    Fluttertoast.showToast(
      msg: "ERROR: ${response.code} | ${response.message}",
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    debugPrint("EXTERNAL_WALLET: ${response.walletName}");
    Fluttertoast.showToast(msg: "${response.walletName}");
  }

  void fetchAddress() async {
    try {
      Position position = await getCurrentLocation();
      String address = await getAddressFromLatLng(position);
      setState(() {
        currentAddress = address;
      });
    } catch (e) {
      setState(() {
        currentAddress = "Error: ${e.toString()}";
      });
    }
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  Future<void> openCheckout({required int amount}) async {
    // Amount is in paise. 100 = ₹1
    if (!Hive.isBoxOpen('data')) {
      await Hive.openBox('data');
    }
    var box = Hive.box("data");
    var userId = box.get("userId");
    var name = box.get("name");
    var phoneNumber = box.get("phoneNumber");

    var options = {
      'key': 'rzp_live_5pIPZksHeaUBbK', // 🔑 Replace with your Razorpay Key
      'amount': amount * 100, // Amount is in paise. 100 = ₹1
      'name': '${name}',
      'description': 'Payment for booking',
      'prefill': {'contact': '${phoneNumber}', 'email': '$name@example.com'},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final order = ref.watch(orderCreateProvider);

    return Scaffold(
      backgroundColor: defaultColor,
      body:
          loder == true
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: Column(
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
                          SizedBox(height: 40.h),
                          OrderId(title: "Pick Up Address:", subtitle: ""),
                          Text(
                            "$currentAddress",
                            style: GoogleFonts.kumbhSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                              color: Color.fromARGB(104, 14, 26, 31),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          loder = true;
                        });
                        ref
                            .read(orderCreateProvider.notifier)
                            .updatePaymentType(selectedOption!);
                        if (selectedOption == "Mobile Banking") {
                          try {
                            await openCheckout(
                              amount: order!.totalBookedAmount.toInt(),
                            );
                          } catch (e) {
                            Fluttertoast.showToast(
                              msg: "Some thing went wrong",
                              toastLength: Toast.LENGTH_LONG,
                              backgroundColor: Colors.red,
                            );
                            setState(() {
                              loder = false;
                            });
                          }
                        } else {
                          ref
                              .read(orderCreateProvider.notifier)
                              .updateTrnx("N/A");
                          try {
                            final service = OrderService(createDio());
                            OrderCreateResponse response = await service
                                .createOrder(order!);
                            if (response.message == "Order added") {
                              Fluttertoast.showToast(
                                msg: "Order Placed Successfully",
                              );
                              Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                                (route) => false,
                              );
                            } else {
                              Fluttertoast.showToast(msg: response.message);
                            }
                          } catch (e) {
                            Fluttertoast.showToast(
                              msg: "Some thing went wrong",
                              toastLength: Toast.LENGTH_LONG,
                              backgroundColor: Colors.red,
                            );
                            setState(() {
                              loder = false;
                            });
                          }
                        }

                        // Navigator.push(
                        //   context,
                        //   CupertinoPageRoute(
                        //     builder: (context) => PaymentdetailsPage(),
                        //   ),
                        // );
                        // if (loder == false) {
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

Future<Position> getCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled.');
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception('Location permissions are permanently denied');
  }

  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}

Future<String> getAddressFromLatLng(Position position) async {
  List<Placemark> placemarks = await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );

  final place = placemarks.first;
  return "${place.name}, ${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
}
