import 'package:dio/dio.dart';
import 'package:laundry_app/home/getallmodel/getAllServiceModel.dart';
import 'package:laundry_app/payment/model/createOrder.model.dart';
import 'package:laundry_app/payment/model/slot.model.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:convert';
part 'createOrder.service.g.dart';

@RestApi(baseUrl: 'https://rl4km84x-8000.inc1.devtunnels.ms')
abstract class OrderService {
  factory OrderService(Dio dio, {String baseUrl}) = _OrderService;

  @POST('/api/create-order')
  Future<OrderCreateResponse> createOrder(@Body() OrderCreateModel orderCreateModel);
}


// To parse this JSON data, do
//
//     final orderCreateResponse = orderCreateResponseFromJson(jsonString);



OrderCreateResponse orderCreateResponseFromJson(String str) => OrderCreateResponse.fromJson(json.decode(str));

String orderCreateResponseToJson(OrderCreateResponse data) => json.encode(data.toJson());

class OrderCreateResponse {
    String message;

    OrderCreateResponse({
        required this.message,
    });

    factory OrderCreateResponse.fromJson(Map<String, dynamic> json) => OrderCreateResponse(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
