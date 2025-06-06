import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/bottom/location.page.dart';
import 'package:laundry_app/bottom/lorem/lorempage.dart';
import 'package:laundry_app/bottom/profile.page.dart';
import 'package:laundry_app/bottom/service.page.dart';
import 'package:laundry_app/constant/colors/myColors.dart';
import 'package:laundry_app/home/controller/home.page.controller.dart';
import 'package:laundry_app/home/controller/homebannerController.dart';
import 'package:laundry_app/home/getAllServiceControleller/getAllController.dart';
import 'package:laundry_app/home/productController/productController.dart';
import 'package:laundry_app/home/support.page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController();
  int _currentPage = 0;
  String? selectedTitle;
  double? selectedPrice;

  @override
  void initState() {
    super.initState();
    //

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeNotifierProvider.notifier).fetchAllData();
    });
    _scrollController.addListener(() {
      double page =
          _scrollController.offset / 313.84.w; // Adjust according to item width
      setState(() {
        _currentPage = page.round();
      });
    });
  }

  Future<void> _getCurrentAddress() async {
    try {
      // 1. Check permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }

      // 2. Get current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // 3. Reverse geocode
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark place = placemarks.first;

      setState(() {
        currentAddress =
            "${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}, ${place.postalCode}";
        loading = false;
      });
    } catch (e) {
      setState(() {
        currentAddress = "Failed to get address: $e";
        loading = false;
      });
    }
  }

  List<Map<String, String>> mylist = [
    {'imageUrl': "assets/laundry.png"},
    {'imageUrl': "assets/laundry2.png"},
    {'imageUrl': "assets/laundry3.png"},
    {'imageUrl': "assets/laundry4.png"},
    {'imageUrl': "assets/laundry5.png"},
  ];

  List<Map<String, String>> popularList = [
    {"imageUrl": "assets/popular1.png"},
    {"imageUrl": "assets/popular2.png"},
    {"imageUrl": "assets/popular3.png"},
    {"imageUrl": "assets/popular4.png"},
  ];

  List<Map<String, String>> cardList = [
    {"imageUrl": "assets/shirt.png", "name": "Shirt", "ammount": " ₹ 18.00"},
    {
      "imageUrl": "assets/t-shirt.png",
      "name": "T-Shirt",
      "ammount": " ₹ 20.50",
    },
    {"imageUrl": "assets/jacket.png", "name": "Jacket", "ammount": " ₹ 28.74"},
  ];
  int bottomTab = 0;
  String currentAddress = "Fetching current address";
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeNotifierProvider);
    if (homeState.isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (homeState.error != null) {
      return Scaffold(body: Center(child: Text("Error: ${homeState.error}")));
    }
    return Scaffold(
      backgroundColor: defaultColor,
      body:
          bottomTab == 0
              ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,

                      color: Color.fromARGB(255, 0, 116, 168),
                      child: Column(
                        children: [
                          SizedBox(height: 65.h),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w, right: 30.w),
                            child: Row(
                              children: [
                                Text(
                                  "Locations",
                                  style: GoogleFonts.kumbhSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SupportScreen(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 39.w,
                                    height: 39.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: Color.fromARGB(191, 6, 79, 112),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.contact_support_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            children: [
                              SizedBox(width: 48.w),
                              Icon(Icons.location_on, color: Colors.white),
                              Padding(
                                padding: EdgeInsets.only(left: 20.w),
                                child: Text(
                                  "$currentAddress",
                                  style: GoogleFonts.kumbhSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                    SizedBox(height: 23.h),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w, right: 15.w),
                      child: Row(
                        children: [
                          Text(
                            "Special For You",
                            style: GoogleFonts.kumbhSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "See All",
                            style: GoogleFonts.kumbhSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: buttonColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      children: [
                        SizedBox(
                          height: 210.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            controller: _scrollController,
                            itemCount: homeState.banners!.data.length,
                            itemBuilder: (context, index) {
                              return Image.network(
                                // mylist[index]["imageUrl"].toString(),
                                "https://rl4km84x-8000.inc1.devtunnels.ms" +
                                    homeState.banners!.data[index].image,
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: homeState.banners!.data.length,
                          effect: ExpandingDotsEffect(
                            activeDotColor: buttonColor,
                            dotColor: Colors.grey,
                            dotHeight: 8.w,
                            dotWidth: 8.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w, right: 15.w),
                      child: Row(
                        children: [
                          Text(
                            "Service",
                            style: GoogleFonts.kumbhSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "See All",
                            style: GoogleFonts.kumbhSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: buttonColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: SizedBox(
                        height: 100.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeState.services!.data.length,
                          itemBuilder: (context, index) {
                            return Container(
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
                                    // "assets/Clothes.pn
                                    "https://rl4km84x-8000.inc1.devtunnels.ms${homeState.services!.data[index].iconImage}",
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w, right: 15.w),
                      child: Row(
                        children: [
                          Text(
                            "Popular Service ",
                            style: GoogleFonts.kumbhSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "See All",
                            style: GoogleFonts.kumbhSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: buttonColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 170.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeState.popularServices!.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: Stack(
                              children: [
                                Image.network(
                                  // popularList[index]["imageUrl"].toString(),
                                  "https://rl4km84x-8000.inc1.devtunnels.ms${homeState.popularServices!.data[index].bannerImage}",
                                ),
                                Positioned(
                                  top: 10.h,
                                  left: 16.w,
                                  child: Container(
                                    width: 59.25.w,
                                    height: 33.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Color.fromARGB(255, 255, 254, 254),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          // "4.8",
                                          homeState
                                              .popularServices!
                                              .data[index]
                                              .rating
                                              .toString(),
                                          style: GoogleFonts.kumbhSans(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                            color: Color.fromARGB(
                                              255,
                                              30,
                                              30,
                                              30,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5.w),
                                        Icon(
                                          Icons.star,
                                          color: Color.fromARGB(
                                            255,
                                            252,
                                            213,
                                            63,
                                          ),
                                          size: 20.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: homeState.products!.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            right: 15.w,
                            bottom: 20.h,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 88.54.h,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(11.54.r),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.66.r,
                                  spreadRadius: 0,
                                  color: Color.fromARGB(63, 0, 0, 0),
                                  offset: Offset(0, 4.66),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                                bottom: 5.h,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 80.w,
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          // cardList[index]["imageUrl"].toString(),
                                          "https://rl4km84x-8000.inc1.devtunnels.ms${homeState.products!.data[index].image}",
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 23.w),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // "Shirt",
                                        // cardList[index]["name"].toString(),
                                        homeState.products!.data[index].title,
                                        style: GoogleFonts.notoSansKr(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.98.sp,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                      // Row(
                                      //   children: [
                                      //     Text(
                                      //       // "iron Only",
                                      //       selectedTitle != null
                                      //           ? "$selectedTitle"
                                      //           : "Select service",
                                      //       style: GoogleFonts.notoSansKr(
                                      //         fontWeight: FontWeight.bold,
                                      //         fontSize: 12.32.sp,
                                      //         color: Color.fromARGB(
                                      //           255,
                                      //           155,
                                      //           150,
                                      //           150,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     // Container(
                                      //     //   width: 25.w,
                                      //     //   height: 35.h,
                                      //     //   child: PopupMenuButton<String>(
                                      //     //     icon: Padding(
                                      //     //       padding: EdgeInsets.only(
                                      //     //         bottom: 10.h,
                                      //     //       ),
                                      //     //       child: Icon(
                                      //     //         Icons.arrow_drop_down,
                                      //     //       ),
                                      //     //     ),
                                      //     //     onSelected: (value) {
                                      //     //       setState(() {
                                      //     //         selectedTitle = value;
                                      //     //         // Find the corresponding price
                                      //     //         selectedPrice =
                                      //     //             homeState
                                      //     //                 .products!
                                      //     //                 .data[index]
                                      //     //                 .priceJson
                                      //     //                 .firstWhere(
                                      //     //                   (item) =>
                                      //     //                       item.title ==
                                      //     //                       value,
                                      //     //                 )
                                      //     //                 .price;
                                      //     //       });
                                      //     //     },
                                      //     //     itemBuilder: (context) {
                                      //     //       return homeState
                                      //     //           .products!
                                      //     //           .data[index]
                                      //     //           .priceJson
                                      //     //           .map<PopupMenuItem<String>>(
                                      //     //             (item) {
                                      //     //               return PopupMenuItem<
                                      //     //                 String
                                      //     //               >(
                                      //     //                 height: 30.h,
                                      //     //                 value: item.title,
                                      //     //                 child: Text(
                                      //     //                   item.title,
                                      //     //                 ),
                                      //     //               );
                                      //     //             },
                                      //     //           )
                                      //     //           .toList();
                                      //     //     },
                                      //     //     // itemBuilder:
                                      //     //     //     (context) => [
                                      //     //     //       PopupMenuItem(
                                      //     //     //         height: 30.h,
                                      //     //     //         value:
                                      //     //     //             data
                                      //     //     //                 .data[index]
                                      //     //     //                 .priceJson[index]
                                      //     //     //                 .title,
                                      //     //     //         child: Text(
                                      //     //     //           data
                                      //     //     //               .data[index]
                                      //     //     //               .priceJson[index]
                                      //     //     //               .title,
                                      //     //     //         ),
                                      //     //     //       ),
                                      //     //     //       PopupMenuItem(
                                      //     //     //         onTap: () {},
                                      //     //     //         height: 30.h,
                                      //     //     //         value:
                                      //     //     //             data
                                      //     //     //                 .data[index]
                                      //     //     //                 .priceJson
                                      //     //     //                 .last
                                      //     //     //                 .title,
                                      //     //     //         child: Text(
                                      //     //     //           data
                                      //     //     //               .data[index]
                                      //     //     //               .priceJson
                                      //     //     //               .last
                                      //     //     //               .title,
                                      //     //     //         ),
                                      //     //     //       ),
                                      //     //     //     ],
                                      //     //   ),
                                      //     // ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        " ₹ ${homeState.products!.data[index].priceJson[0].price.toStringAsFixed(2)}",

                                        // default before selection
                                        style: GoogleFonts.notoSansKr(
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            bottomTab = 2;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 5.h),
                                          width: 25.w,
                                          height: 25.h,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                              255,
                                              114,
                                              200,
                                              243,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              3.49,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          bottomTab = 2;
                        });
                      },
                      child: Container(
                        width: 334.w,
                        height: 68.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: buttonColor,
                        ),
                        child: Center(
                          child: Text(
                            "Book now",
                            style: GoogleFonts.kumbhSans(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              )
              : bottomTab == 1
              ? LoremPage()
              : bottomTab == 2
              ? ServicePage()
              : ProfilePage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            bottomTab = value;
          });
        },
        currentIndex: bottomTab,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color.fromARGB(255, 3, 145, 196),
        unselectedItemColor: Color.fromARGB(255, 2, 79, 100),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 30.sp),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 30.sp),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined, size: 30.sp),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30.sp),
            label: "",
          ),
        ],
      ),
    );
  }
}
