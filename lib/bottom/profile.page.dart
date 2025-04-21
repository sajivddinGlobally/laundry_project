import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:laundry_app/account/edit.page.dart';
import 'package:laundry_app/constant/colors/myColors.dart';
import 'package:laundry_app/signUp.page/view/signUp.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");
    var userId = box.get("userId");
    var userName = box.get("name");
    var userEmail = box.get("email");
    var userPhone = box.get("phoneNumber");
    var userAddress = box.get("currentAddress");
    final TextEditingController _firstNameController = TextEditingController(
      text: "$userName",
    );
    final TextEditingController _emailControlelr = TextEditingController(
      text: "$userEmail",
    );
    final TextEditingController _phoneController = TextEditingController(
      text: "+91 $userPhone",
    );
    final TextEditingController _addressController = TextEditingController(
      text: "$userAddress",
    );
    final TextEditingController newPasswordController = TextEditingController(
      text: "***********",
    );
    final TextEditingController reTypeNewPassword = TextEditingController(
      text: "***********",
    );
    return Scaffold(
      backgroundColor: defaultColor,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (userId == null) ...[
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Container(
                  width: 350.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w),
                      Icon(Icons.login, color: Colors.white),
                      SizedBox(width: 20.w),
                      Text(
                        "Login",
                        style: GoogleFonts.kumbhSans(
                          fontSize: 24.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ] else ...[
            Row(
              children: [
                SizedBox(width: 35.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal details",
                      style: GoogleFonts.kumbhSans(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 2, 79, 100),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Personal information",
                      style: GoogleFonts.kumbhSans(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 2, 79, 100),
                      ),
                    ),
                  ],
                ),
                Spacer(),

                SizedBox(width: 41.w),
              ],
            ),
            SizedBox(height: 50.h),
            _buildTextField("First Name", _firstNameController),
            SizedBox(height: 30.h),
            _buildTextField("E-mail", _emailControlelr),
            SizedBox(height: 30.h),
            _buildTextField("Phone number", _phoneController),
            SizedBox(height: 30.h),
            _buildTextField("Current Address", _addressController),
            SizedBox(height: 30.h),

            SizedBox(height: 50.h),

            Center(
              child: GestureDetector(
                onTap: () {
                  box.clear();
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => SignUp()),
                  );
                  Fluttertoast.showToast(msg: "Logout successful");
                },
                child: Container(
                  width: 350.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w),
                      Icon(Icons.logout, color: Colors.white),
                      SizedBox(width: 20.w),
                      Text(
                        "Logout ",
                        style: GoogleFonts.kumbhSans(
                          fontSize: 24.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool isReadOnly = true,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 35.w, right: 35.w),
      child: SizedBox(
        height: 50.h,
        child: TextField(
          controller: controller,
          readOnly: isReadOnly,
          onTap: onTap,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 10.h, left: 10.w),
            labelText: label,
            labelStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: Color.fromARGB(255, 156, 156, 156),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(width: 1.w),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.w,
                color: Color.fromARGB(255, 87, 79, 79),
              ),
            ),
            suffixIcon: Icon(
              Icons.done_outlined,
              color: Color.fromARGB(255, 87, 79, 79),
            ),
          ),
        ),
      ),
    );
  }
}
