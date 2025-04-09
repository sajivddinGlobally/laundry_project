// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    String message;
    List<Datum> data;

    ProductModel({
        required this.message,
        required this.data,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
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
    String title;
    String image;
    List<PriceJson> priceJson;

    Datum({
        required this.id,
        required this.title,
        required this.image,
        required this.priceJson,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: Id.fromJson(json["_id"]),
        title: json["title"],
        image: json["image"],
        priceJson: List<PriceJson>.from(json["price_json"].map((x) => PriceJson.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "title": title,
        "image": image,
        "price_json": List<dynamic>.from(priceJson.map((x) => x.toJson())),
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

class PriceJson {
    String title;
    double price;

    PriceJson({
        required this.title,
        required this.price,
    });

    factory PriceJson.fromJson(Map<String, dynamic> json) => PriceJson(
        title: json["title"],
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
    };
}
