// To parse this JSON data, do
//
//     final userOrderResponse = userOrderResponseFromJson(jsonString);

import 'dart:convert';

UserOrderResponse userOrderResponseFromJson(String str) => UserOrderResponse.fromJson(json.decode(str));

String userOrderResponseToJson(UserOrderResponse data) => json.encode(data.toJson());

class UserOrderResponse {
    String message;
    List<Datum> data;

    UserOrderResponse({
        required this.message,
        required this.data,
    });

    factory UserOrderResponse.fromJson(Map<String, dynamic> json) => UserOrderResponse(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Id id;
    String orderId;
    String userid;
    String createDate;
    String deliveryDate;
    String trxId;
    String paymentTpe;
    List<ProductElement> product;
    double totalBookedAmount;
    bool iroing;
    bool deliverd;
    String barcodePath;
    String qrcodePath;
    String address;
    double latitude;
    double longitude;
    User user;
    String deliverySlot;
    String pickupSlot;

    Datum({
        required this.id,
        required this.orderId,
        required this.userid,
        required this.createDate,
        required this.deliveryDate,
        required this.trxId,
        required this.paymentTpe,
        required this.product,
        required this.totalBookedAmount,
        required this.iroing,
        required this.deliverd,
        required this.barcodePath,
        required this.qrcodePath,
        required this.address,
        required this.latitude,
        required this.longitude,
        required this.user,
        required this.deliverySlot,
        required this.pickupSlot,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: Id.fromJson(json["_id"]),
        orderId: json["order_id"],
        userid: json["userid"],
        createDate: json["create_date"],
        deliveryDate: json["delivery_date"],
        trxId: json["trx_id"],
        paymentTpe: json["payment_tpe"],
        product: List<ProductElement>.from(json["product"].map((x) => ProductElement.fromJson(x))),
        totalBookedAmount: json["total_booked_amount"],
        iroing: json["iroing"],
        deliverd: json["deliverd"],
        barcodePath: json["barcode_path"],
        qrcodePath: json["qrcode_path"],
        address: json["address"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        user: User.fromJson(json["user"]),
        deliverySlot: json["delivery_slot"],
        pickupSlot: json["pickup_slot"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "order_id": orderId,
        "userid": userid,
        "create_date": createDate,
        "delivery_date": deliveryDate,
        "trx_id": trxId,
        "payment_tpe": paymentTpe,
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
        "total_booked_amount": totalBookedAmount,
        "iroing": iroing,
        "deliverd": deliverd,
        "barcode_path": barcodePath,
        "qrcode_path": qrcodePath,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "user": user.toJson(),
        "delivery_slot": deliverySlot,
        "pickup_slot": pickupSlot,
    };
}

class Id {
    String oid;

    Id({
        required this.oid,
    });

    factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
    };
}

class ProductElement {
    int quantity;
    ProductProduct product;
    ChosedService chosedService;

    ProductElement({
        required this.quantity,
        required this.product,
        required this.chosedService,
    });

    factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        quantity: json["quantity"],
        product: ProductProduct.fromJson(json["product"]),
        chosedService: ChosedService.fromJson(json["chosed_service"]),
    );

    Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "product": product.toJson(),
        "chosed_service": chosedService.toJson(),
    };
}

class ChosedService {
  String title;
  double price;

  ChosedService({
    required this.title,
    required this.price,
  });

  factory ChosedService.fromJson(Map<String, dynamic> json) => ChosedService(
        title: json["title"],
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
      };
}


class ProductProduct {
    String title;
    String image;
    List<ChosedService> priceJson;

    ProductProduct({
        required this.title,
        required this.image,
        required this.priceJson,
    });

    factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
        title: json["title"],
        image: json["image"],
        priceJson: List<ChosedService>.from(json["price_json"].map((x) => ChosedService.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "price_json": List<dynamic>.from(priceJson.map((x) => x.toJson())),
    };
}

class User {
    String name;
    String phone;
    String email;

    User({
        required this.name,
        required this.phone,
        required this.email,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
    };
}
