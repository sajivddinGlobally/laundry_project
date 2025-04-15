// To parse this JSON data, do
//
//     final orderCreateModel = orderCreateModelFromJson(jsonString);

import 'dart:convert';

OrderCreateModel orderCreateModelFromJson(String str) => OrderCreateModel.fromJson(json.decode(str));

String orderCreateModelToJson(OrderCreateModel data) => json.encode(data.toJson());

class OrderCreateModel {
    String userid;
    String trxId;
    String paymentTyp;
    int totalBookedAmount;
    String address;
    double latitude;
    double longitude;
    String deliverySlot;
    String pickupSlot;
    List<Product> product;

    OrderCreateModel({
        required this.userid,
        required this.trxId,
        required this.paymentTyp,
        required this.totalBookedAmount,
        required this.address,
        required this.latitude,
        required this.longitude,
        required this.deliverySlot,
        required this.pickupSlot,
        required this.product,
    });

    factory OrderCreateModel.fromJson(Map<String, dynamic> json) => OrderCreateModel(
        userid: json["userid"],
        trxId: json["trx_id"],
        paymentTyp: json["payment_typ"],
        totalBookedAmount: json["total_booked_amount"],
        address: json["address"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        deliverySlot: json["delivery_slot"],
        pickupSlot: json["pickup_slot"],
        product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userid": userid,
        "trx_id": trxId,
        "payment_typ": paymentTyp,
        "total_booked_amount": totalBookedAmount,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "delivery_slot": deliverySlot,
        "pickup_slot": pickupSlot,
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
    };
}

class Product {
    int quantity;
    String productId;
    ChosedService chosedService;

    Product({
        required this.quantity,
        required this.productId,
        required this.chosedService,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        quantity: json["quantity"],
        productId: json["product_id"],
        chosedService: ChosedService.fromJson(json["chosed_service"]),
    );

    Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "product_id": productId,
        "chosed_service": chosedService.toJson(),
    };
}

class ChosedService {
    String title;
    int price;

    ChosedService({
        required this.title,
        required this.price,
    });

    factory ChosedService.fromJson(Map<String, dynamic> json) => ChosedService(
        title: json["title"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
    };
}
