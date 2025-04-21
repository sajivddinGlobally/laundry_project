import 'package:dio/dio.dart';
import 'package:laundry_app/bottom/lorem/model/orders.model.dart';
import 'package:laundry_app/home/getallmodel/getAllServiceModel.dart';
import 'package:laundry_app/payment/model/createOrder.model.dart';
import 'package:laundry_app/payment/model/slot.model.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:convert';
part 'order.service.g.dart';

@RestApi(baseUrl: 'https://rl4km84x-8000.inc1.devtunnels.ms')
abstract class UserOrderService {
  factory UserOrderService(Dio dio, {String baseUrl}) = _UserOrderService;

  @GET('/api/orders-users/{id}')
  Future<UserOrderResponse> fetchOrders(@Path("id") String id);
}


