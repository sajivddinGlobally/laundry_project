import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:laundry_app/constant/colors/myColors.dart';
import 'package:laundry_app/payment/controller/productCart.controller.dart';
import 'package:laundry_app/payment/payment.page.dart';

class LocationPickerPage extends ConsumerStatefulWidget {
  @override
  _LocationPickerPageState createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends ConsumerState<LocationPickerPage> {
  GoogleMapController? _mapController;
  LatLng? _currentLatLng;
  String _address = "Loading...";
  MapType _currentMapType = MapType.normal; // Default map type

  @override
  void initState() {
    super.initState();
    _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    _currentLatLng = LatLng(position.latitude, position.longitude);
    _getAddressFromLatLng(_currentLatLng!);
    setState(() {});
  }

  Future<void> _getAddressFromLatLng(LatLng latLng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );

    Placemark place = placemarks[0];
    setState(() {
      _address =
          "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
    });
  }

  // Toggle between Normal and Satellite view
  void _toggleMapType() {
    setState(() {
      _currentMapType =
          _currentMapType == MapType.normal
              ? MapType.satellite
              : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Pick Location"),
      ),
      body:
          _currentLatLng == null
              ? Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Expanded(
                    child: GoogleMap(
                      onMapCreated: (controller) => _mapController = controller,
                      initialCameraPosition: CameraPosition(
                        target: _currentLatLng!,
                        zoom: 16,
                      ),
                      mapType: _currentMapType, // Set the map type
                      markers: {
                        Marker(
                          markerId: MarkerId("selected-location"),
                          position: _currentLatLng!,
                          draggable: true,
                          onDragEnd: (newPosition) {
                            _currentLatLng = newPosition;
                            _getAddressFromLatLng(newPosition);
                          },
                        ),
                      },
                      onTap: (latLng) {
                        setState(() {
                          _currentLatLng = latLng;
                        });
                        _getAddressFromLatLng(latLng);
                      },
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              showSimpleAddressSheet(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                            ),
                            child: Text("Manual"),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(addressStateNotifer.notifier)
                                  .update("$_address");
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => PaymentPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                            ),
                            child: Text("Confirm"),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Add a button to toggle map type (Normal/Satellite)
                ],
              ),
    );
  }

  void showSimpleAddressSheet(BuildContext context) {
    final TextEditingController streetController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController stateController = TextEditingController();
    final TextEditingController pincodeController = TextEditingController();
    final TextEditingController flatnoController = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Enter Your Address",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                _customTextField("Flat no", controller: flatnoController),
                _customTextField("Street", controller: streetController),
                _customTextField("City", controller: cityController),
                _customTextField("State", controller: stateController),
                _customTextField(
                  "Pincode",
                  keyboardType: TextInputType.number,
                  controller: pincodeController,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final flatNo = flatnoController.text;
                    final street = streetController.text;
                    final city = cityController.text;
                    final state = stateController.text;
                    final pincode = pincodeController.text;

                    print("Street: $street");
                    print("City: $city");
                    print("State: $state");
                    print("Pincode: $pincode");

                    // yahan tu API call ya save logic likh sakta hai

                    Navigator.pop(context);
                    ref
                        .read(addressStateNotifer.notifier)
                        .update("$flatNo, $street, $city, $state, $pincode");
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => PaymentPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  ),
                  child: Text(
                    "Save Address",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _customTextField(
  String label, {
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
