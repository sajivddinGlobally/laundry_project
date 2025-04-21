import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_app/bottom/lorem/model/orders.model.dart';
import 'package:laundry_app/config/pretty.dio.dart';
import 'package:laundry_app/staff/model/perticulerOrder.model.dart';
import 'package:laundry_app/staff/service/adminorder.service.dart';

final adminOrderProvider = FutureProvider<UserOrderResponse>(
  (ref) async {
    final service = AdminOrderService(createDio());
    try {
      return await service.fetchOrders();
    } catch (e) {
      debugPrint("Failed to fetch orders: $e");
      throw Exception("Failed to fetch orders");
    }
  },
);

final adminOrderDetailProvider = FutureProvider.family<PerticulerOrderModel, String>(
  (ref, id) async {
    final service = AdminOrderService(createDio());
    try {
      return await service.fetchPerticulerOrder(id);
    } catch (e) {
      debugPrint("Failed to fetch order details: $e");
      throw Exception("Failed to fetch order details");
    }
  },
);