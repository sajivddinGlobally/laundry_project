import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;

class RoadMapScreen extends StatefulWidget {
  @override
  _RoadMapScreenState createState() => _RoadMapScreenState();
}

class _RoadMapScreenState extends State<RoadMapScreen> {
  GoogleMapController? mapController;

  LatLng source = LatLng(28.6139, 77.2090); // Delhi
  LatLng destination = LatLng(28.5355, 77.3910); // Noida

  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];

  final String googleAPIKey = 'AIzaSyBBf-7KlnwhL3qB0AnIXu4meJlKLsREu7w';

  @override
  void initState() {
    super.initState();
    getDirections();
  }

  Future<void> getDirections() async {
    PolylinePoints polylinePoints = PolylinePoints();
    final url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${source.latitude},${source.longitude}&destination=${destination.latitude},${destination.longitude}&key=$googleAPIKey";

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    if (data['routes'] != null && data['routes'].isNotEmpty) {
      final points = polylinePoints.decodePolyline(
          data['routes'][0]['overview_polyline']['points']);

      polylineCoordinates.clear();
      for (var point in points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }

      setState(() {
        _polylines.add(
          Polyline(
            polylineId: PolylineId('route'),
            color: Colors.blue,
            width: 5,
            points: polylineCoordinates,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Road Route")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: source, zoom: 12),
        polylines: _polylines,
        markers: {
          Marker(markerId: MarkerId("source"), position: source),
          Marker(markerId: MarkerId("destination"), position: destination),
        },
        onMapCreated: (controller) => mapController = controller,
      ),
    );
  }
}
