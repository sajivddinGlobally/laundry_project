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
  double manuelLAt = 0.0;
  double manuelLong = 0.0;
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
      manuelLAt = latLng.latitude;
      manuelLong = latLng.longitude;
      _address =
          "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
    });
  }

  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [
    LatLng(28.6139, 77.2090), // Point A (Delhi)
    LatLng(28.5355, 77.3910), // Point B (Noida)
  ];

  // Toggle between Normal and Satellite view
  void _toggleMapType() {
    setState(() {
      _currentMapType =
          _currentMapType == MapType.normal
              ? MapType.satellite
              : MapType.normal;
    });
  }

  Future<void> getLatLongFromAddress(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);

      if (locations.isNotEmpty) {
        double latitude = locations.first.latitude;
        double longitude = locations.first.longitude;
        setState(() {
          manuelLAt = latitude;
          manuelLong = longitude;
        });
        print('Latitude: $latitude, Longitude: $longitude');
      } else {
        print('No results found');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  void _addPolyline() {
    Polyline polyline = Polyline(
      polylineId: PolylineId("route"),
      color: Colors.blue,
      width: 5,
      points: polylineCoordinates,
    );

    setState(() {
      _polylines.add(polyline);
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
                  // Expanded(
                  //   child: GoogleMap(
                  //     onMapCreated: (controller) => _mapController = controller,
                  //     initialCameraPosition: CameraPosition(
                  //       target: _currentLatLng!,
                  //       zoom: 16,
                  //     ),
                  //     mapType: _currentMapType, // Set the map type

                  //     onTap: (latLng) {
                  //       setState(() {
                  //         _currentLatLng = latLng;
                  //       });
                  //       _getAddressFromLatLng(latLng);
                  //     },
                  //     myLocationEnabled: true,
                  //     myLocationButtonEnabled: true,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(padding: EdgeInsets.only(bottom: 10),
                        child: Center(
                          child: Text(_address,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ),
                        Row(
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
                                  ref.read(orderCreateProvider.notifier).updateLatitude(manuelLAt);
                                  ref.read(orderCreateProvider.notifier).updateLongitude(manuelLong);
                                  ref
                                      .read(orderCreateProvider.notifier)
                                      .updateAddress("$_address");
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
                    getLatLongFromAddress(
                      "$flatNo, $street, $city, $state, $pincode",
                    );
                    ref
                        .read(orderCreateProvider.notifier)
                        .updateAddress(
                          "$flatNo, $street, $city, $state, $pincode",
                        );
                    ref
                        .read(orderCreateProvider.notifier)
                        .updateLatitude(manuelLAt);
                    ref
                        .read(orderCreateProvider.notifier)
                        .updateLongitude(manuelLong);
                    Navigator.pop(context);

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
