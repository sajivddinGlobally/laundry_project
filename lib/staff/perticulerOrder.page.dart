import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/config/pretty.dio.dart';
import 'package:laundry_app/staff/controller/admin.orders.controller.dart';
import 'package:laundry_app/staff/model/perticulerOrder.model.dart';
import 'package:laundry_app/staff/model/update.order.model.dart';
import 'package:laundry_app/staff/service/adminorder.service.dart';

class AdminOrderDetailsScreen extends ConsumerWidget {
  final String orderId;

  const AdminOrderDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(adminOrderDetailProvider(orderId));

    return Scaffold(
      appBar: AppBar(title: const Text("Order Details")),
      body: orderAsync.when(
        data: (order) {
          final data = order.data;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _userInfo(data.user),
                const SizedBox(height: 12),
                _orderSummary(data),
                const SizedBox(height: 12),
                _addressSlot(data),
                const SizedBox(height: 12),
                const Text(
                  "Products",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...data.product.map((e) => _productTile(e, context)),
                const Divider(),
                _totalSection(data.totalBookedAmount.toInt()),
                const SizedBox(height: 20),
                _barcodeQrSection(data),
                const SizedBox(height: 100),
                if (data.iroing == false) ...[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        // TODO: Add pick order logic
                        debugPrint("Pick Order tapped");
                        final service = AdminOrderService(createDio());
                        UpdatePerticulerOrderResPonse res = await service
                            .updateOrderStatus(
                              orderId,
                              UpdatePerticulerOrder(
                                iroing: true,
                                deliverd: false,
                              ),
                            );
                        Fluttertoast.showToast(
                          msg: "Order Picked",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                      ),
                      child: Text(
                        "Pick Order",
                        style: GoogleFonts.montserrat(color: Colors.white),
                      ),
                    ),
                  ),
                ] else if (data.iroing == true && data.deliverd == false) ...[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        // TODO: Add deliver order logic
                        debugPrint("Deliver Order tapped");
                        final service = AdminOrderService(createDio());
                        UpdatePerticulerOrderResPonse res = await service
                            .updateOrderStatus(
                              orderId,
                              UpdatePerticulerOrder(
                                iroing: true,
                                deliverd: true,
                              ),
                            );
                        Fluttertoast.showToast(
                          msg: "Order Delivered",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                      ),
                      child: Text(
                        "Deliver Order",
                        style: GoogleFonts.montserrat(color: Colors.white),
                      ),
                    ),
                  ),
                ],
                // space for bottom buttons
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),

      // 🔽 Bottom buttons
    );
  }

  Widget _userInfo(User user) => Card(
    child: ListTile(
      title: Text(user.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(user.phone), Text(user.email)],
      ),
    ),
  );

  Widget _orderSummary(Data data) => Card(
    child: ListTile(
      title: Text("Order ID: ${data.orderId}"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Created: ${data.createDate}"),
          Text("Delivery: ${data.deliveryDate}"),
          Text("Payment: ${data.paymentTpe}"),
          Text(
            "Status: Delivered - ${data.deliverd}, Ironing - ${data.iroing}",
          ),
        ],
      ),
    ),
  );

  Widget _addressSlot(Data data) => Card(
    child: ListTile(
      title: const Text("Delivery Address"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.address),
          const SizedBox(height: 8),
          Text("Pickup Slot: ${data.pickupSlot}"),
          Text("Delivery Slot: ${data.deliverySlot}"),
        ],
      ),
    ),
  );

  Widget _productTile(ProductElement product, BuildContext context) {
    final baseUrl = "https://rl4km84x-8000.inc1.devtunnels.ms"; // update this
    return Card(
      child: ListTile(
        leading: Image.network(
          "$baseUrl${product.product.image}",
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (ctx, _, __) => const Icon(Icons.image),
        ),
        title: Text(product.product.title),
        subtitle: Text(
          "Service: ${product.chosedService.title} | Qty: ${product.quantity}",
        ),
        trailing: Text("₹${product.chosedService.price * product.quantity}"),
      ),
    );
  }

  Widget _totalSection(int total) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Total Amount",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text("₹$total", style: const TextStyle(fontSize: 16)),
      ],
    ),
  );

  Widget _barcodeQrSection(Data data) {
    final baseUrl = "https://rl4km84x-8000.inc1.devtunnels.ms"; // update this
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Text("Barcode"),
            Image.network("$baseUrl${data.barcodePath}", width: 100),
          ],
        ),
        Column(
          children: [
            const Text("QR Code"),
            Image.network("$baseUrl${data.qrcodePath}", width: 100),
          ],
        ),
      ],
    );
  }
}
