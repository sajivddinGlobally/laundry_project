import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserLocationPage extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String name;
  final String email;
  final String phone;
  final String address;

  const UserLocationPage({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final LatLng location = LatLng(latitude, longitude);

    return Scaffold(
      appBar: AppBar(title: const Text('User Location')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: location, zoom: 15),
        markers: {
          Marker(
            markerId: const MarkerId('user-location'),
            position: location,
            infoWindow: const InfoWindow(title: 'User Location'),
          ),
        },
        mapType: MapType.normal,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showUserLocationBottomSheet(context, name, email, phone, address);
        },
        child: const Icon(Icons.location_on),
      ),
    );
  }

  void showUserLocationBottomSheet(
    BuildContext context,
    String name,
    String email,
    String phone,
    String address,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => DraggableScrollableSheet(
            expand: false,
            builder: (context, scrollController) {
              final TextEditingController _firstNameController =
                  TextEditingController(text: "$name");
              final TextEditingController _emailControlelr =
                  TextEditingController(text: "$email");
              final TextEditingController _phoneController =
                  TextEditingController(text: "+91 $phone");
              final TextEditingController _addressController =
                  TextEditingController(text: "$address");
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 50.h),
                  _buildTextField("First Name", _firstNameController),
                  SizedBox(height: 30.h),
                  _buildTextField("E-mail", _emailControlelr),
                  SizedBox(height: 30.h),
                  _buildTextField("Phone number", _phoneController),
                  SizedBox(height: 30.h),
                  _buildTextField("Current Address", _addressController),
                  SizedBox(height: 30.h),
                ],
              );
            },
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
