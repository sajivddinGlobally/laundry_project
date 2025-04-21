import 'package:flutter/material.dart';

class QrCodePage extends StatelessWidget {
  final String qrImageUrl;

  const QrCodePage({super.key, required this.qrImageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your order QR Code'),
        centerTitle: true,
      ),
      body: Center(
        child: Image.network(
          "https://rl4km84x-8000.inc1.devtunnels.ms$qrImageUrl",
          fit: BoxFit.contain,
          width: 200,
          height: 200,
          errorBuilder: (context, error, stackTrace) {
            return const Text("Failed to load QR code.");
          },
        ),
      ),
    );
  }
}
