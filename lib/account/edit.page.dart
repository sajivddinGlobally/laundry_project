import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laundry_app/constant/colors/myColors.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController _firstNameController = TextEditingController(
    text: "Linda Silth",
  );
  final TextEditingController _emailControlelr = TextEditingController(
    text: " silth@gmail.com",
  );
  final TextEditingController _phoneController = TextEditingController(
    text: "+91 9642854965",
  );
  final TextEditingController _addressController = TextEditingController(
    text: "Gunnersbury House 1 Chapel Hill,london",
  );
  final TextEditingController newPasswordController = TextEditingController(
    text: "***********",
  );
  final TextEditingController reTypeNewPassword = TextEditingController(
    text: "***********",
  );

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
        height: 45.h,
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
      body: Column(
        children: [
          SizedBox(height: 80.h),
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
              Stack(
                children: [
                  Container(
                    width: 58.85.w,
                    height: 58.85.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 217, 217, 217),
                      border: Border.all(
                        color: Color.fromARGB(255, 53, 185, 212),
                        width: 2.w,
                      ),
                    ),
                    child: Center(
                      child:
                          image == null
                              ? Image.asset("assets/girl.png")
                              : ClipOval(
                                child: Image.file(
                                  image!,
                                  width: 58.85.w,
                                  height: 58.85.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                    ),
                  ),
                  Positioned(
                    right: -1.w,
                    bottom: -1.h,
                    child: GestureDetector(
                      onTap: () {
                        showOptions();
                      },
                      child: Container(
                        width: 25.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 53, 185, 212),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 41.w),
            ],
          ),
          SizedBox(height: 30.h),
          _buildTextField("First Name", _firstNameController),
          SizedBox(height: 30.h),
          _buildTextField("E-mail", _emailControlelr),
          SizedBox(height: 30.h),
          _buildTextField("Phone number", _phoneController),
          SizedBox(height: 30.h),
          _buildTextField("Current Address", _addressController),
          SizedBox(height: 30.h),
          _buildTextField("New password", newPasswordController),
          SizedBox(height: 30.h),
          _buildTextField("Re-type New Password", reTypeNewPassword),
        ],
      ),
    );
  }
}
