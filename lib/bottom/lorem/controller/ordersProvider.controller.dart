

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart' show Hive;
import 'package:laundry_app/bottom/lorem/model/orders.model.dart';
import 'package:laundry_app/bottom/lorem/service/order.service.dart';
import 'package:laundry_app/config/pretty.dio.dart';

final userOrdersProvider = FutureProvider<UserOrderResponse>((ref) async { 
  final service = UserOrderService(createDio());
  var box = Hive.box("data");
  var userId = box.get("userId");
  try {
    return await service.fetchOrders(userId.toString());
  } catch (e) {
     debugPrint("Failed to fetch orders: $e");
     throw Exception("Failed to fetch orders"); }
});