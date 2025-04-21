import 'package:dio/dio.dart';
import 'package:laundry_app/bottom/lorem/model/orders.model.dart';
import 'package:laundry_app/home/getallmodel/getAllServiceModel.dart';
import 'package:laundry_app/payment/model/createOrder.model.dart';
import 'package:laundry_app/payment/model/slot.model.dart';
import 'package:laundry_app/staff/model/perticulerOrder.model.dart';
import 'package:laundry_app/staff/model/update.order.model.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:convert';
part 'adminorder.service.g.dart';

@RestApi(baseUrl: 'https://rl4km84x-8000.inc1.devtunnels.ms')
abstract class AdminOrderService {
  factory AdminOrderService(Dio dio, {String baseUrl}) = _AdminOrderService;

  @GET('/api/get-orders')
  Future<UserOrderResponse> fetchOrders();
  @GET('/api/perticuler-order/{id}')
  Future<PerticulerOrderModel> fetchPerticulerOrder(@Path("id") String id);
  @PUT('/api/update-status-orders?id={id}')
  Future<UpdatePerticulerOrderResPonse> updateOrderStatus(
    @Path("id") String id,
    @Body() UpdatePerticulerOrder orderCreateModel,
  );
}


 