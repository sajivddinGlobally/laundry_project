import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/constant/colors/myColors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double page =
          _scrollController.offset / 313.84.w; // Adjust according to item width
      setState(() {
        _currentPage = page.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 215.h,
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
                      Container(
                        width: 39.w,
                        height: 39.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Color.fromARGB(191, 6, 79, 112),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.notifications_rounded,
                            color: Colors.white,
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
                        "Gunnersbury House 1 Chapel Hill,london",
                        style: GoogleFonts.kumbhSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 23.w,
                          right: 20.w,
                          top: 10.h,
                        ),
                        child: SizedBox(
                          height: 49.h,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 8.h),
                              hintText: "search",
                              hintStyle: GoogleFonts.kumbhSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp,
                                color: Color.fromARGB(255, 2, 79, 100),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color.fromARGB(255, 3, 145, 196),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.menu,
                          color: Color.fromARGB(191, 6, 22, 28),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
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
          SizedBox(
            height: 180.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 15.w),
                  child: Image.asset("assets/laundry.png"),
                );
              },
            ),
          ),
          SizedBox(height: 10.h),
          SmoothPageIndicator(
            controller: PageController(
              initialPage: _currentPage,
            ), // Dummy controller
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: buttonColor,
              dotColor: Colors.grey,
              dotHeight: 8.w,
              dotWidth: 8.h,
            ),
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
            child: Row(
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
                      child: Image.asset("assets/Clothes.png"),
                    ),
                  ),
                ),
                Container(
                  width: 71.24.w,
                  height: 71.24.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(99, 196, 196, 196),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: Image.asset("assets/irn.png"),
                    ),
                  ),
                ),
              ],
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
        ],
      ),
    );
  }
}
