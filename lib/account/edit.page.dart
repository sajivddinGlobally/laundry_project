import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laundry_app/account/map.page.dart';
import 'package:laundry_app/config/pretty.dio.dart';
import 'package:laundry_app/constant/colors/myColors.dart';
import 'package:laundry_app/signUp.page/Model/userRegister.model.dart';
import 'package:laundry_app/signUp.page/Model/userRegisterRes.model.dart';
import 'package:laundry_app/signUp.page/controller/loginService.dart';
import 'package:laundry_app/signUp.page/view/signUp.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController _firstNameController = TextEditingController(
    text: "",
  );

  final TextEditingController _phoneController = TextEditingController(
    text: "",
  );
  final TextEditingController _addressController = TextEditingController(
    text: "",
  );
  final TextEditingController newPasswordController = TextEditingController(
    text: "***********",
  );
  final TextEditingController reTypeNewPassword = TextEditingController(
    text: "***********",
  );
  final _nameOfSocietyController = TextEditingController(text: "");
  final _flatNumberController = TextEditingController(text: "");
  final _towerNumberController = TextEditingController(text: "");

  bool loder = false;
  File? image;
  final picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (PickedFile != null) {
        image = File(PickedFile.path);
      }
    });
  }

  Future<void> pickeImageFromCamera() async {
    final PickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (PickedFile != null) {
        image = File(PickedFile.path);
      }
    });
  }

  Future<void> showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                pickImageFromGallery();
              },
              child: Text("Gallery"),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                pickeImageFromCamera();
              },
              child: Text("Camera"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool isReadOnly = false,
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
            suffixIcon:
                isReadOnly
                    ? Icon(
                      Icons.calendar_today,
                      color: Color.fromARGB(255, 87, 79, 79),
                    )
                    : Icon(
                      Icons.edit_outlined,
                      color: Color.fromARGB(255, 87, 79, 79),
                    ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80.h),
            Row(
              children: [
                SizedBox(width: 35.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Register",
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
            _buildTextField("Phone number", _phoneController),
            SizedBox(height: 30.h),
            _buildTextField("Name of Society", _nameOfSocietyController),
            SizedBox(height: 30.h),
            _buildTextField("Flat Number", _flatNumberController),
            SizedBox(height: 30.h),
            _buildTextField("Tower Number", _towerNumberController),
            SizedBox(height: 30.h),
            _buildTextField("Address", _addressController),
            SizedBox(height: 30.h),

            Padding(
              padding: EdgeInsets.only(left: 23.w, right: 23.w),
              child: GestureDetector(
                onTap: () async {
                  if (loder == false) {
                    setState(() {
                      loder = true;
                    });
                    final service = LoginService(createDio());
                    try {
                      UserRegisterResModel res = await service.registerUser(
                        UserRegisterModel(
                          name: _firstNameController.text,

                          phoneNumber: _phoneController.text,
                          currentAddress:
                              "${_nameOfSocietyController.text}, ${_flatNumberController.text}, ${_towerNumberController.text}, ${_addressController.text}",
                          countryCode: "+91",
                          profilePicUrl: "",
                        ),
                      );
                      Fluttertoast.showToast(msg: res.message.toString());
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(builder: (context) => SignUp()),
                        (route) => false,
                      );
                    } catch (e) {
                      Fluttertoast.showToast(msg: e.toString());
                      setState(() {
                        loder = false;
                      });
                    }
                  }
                },
                child: Container(
                  width: 384.w,
                  height: 49.h,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Text(
                      "Register",
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
