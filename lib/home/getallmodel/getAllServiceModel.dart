// To parse this JSON data, do
//
//     final getAllServiceModel = getAllServiceModelFromJson(jsonString);

import 'dart:convert';

GetAllServiceModel getAllServiceModelFromJson(String str) => GetAllServiceModel.fromJson(json.decode(str));

String getAllServiceModelToJson(GetAllServiceModel data) => json.encode(data.toJson());

class GetAllServiceModel {
    String message;
    List<Datum> data;

    GetAllServiceModel({
        required this.message,
        required this.data,
    });

    factory GetAllServiceModel.fromJson(Map<String, dynamic> json) => GetAllServiceModel(
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
    String bannerImage;
    String iconImage;
    String title;
    double rating;

    Datum({
        required this.id,
        required this.bannerImage,
        required this.iconImage,
        required this.title,
        required this.rating,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: Id.fromJson(json["_id"]),
        bannerImage: json["banner_image"],
        iconImage: json["icon_image"],
        title: json["title"],
        rating: json["rating"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "banner_image": bannerImage,
        "icon_image": iconImage,
        "title": title,
        "rating": rating,
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
