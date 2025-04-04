import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapviewPage extends StatefulWidget {
  const MapviewPage({super.key});

  @override
  State<MapviewPage> createState() => _MapviewPageState();
}

class _MapviewPageState extends State<MapviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 55, 162, 210),
    ),);
  }
}