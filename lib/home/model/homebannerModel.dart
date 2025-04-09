// To parse this JSON data, do
//
//     final homeBannerModel = homeBannerModelFromJson(jsonString);

import 'dart:convert';

HomeBannerModel homeBannerModelFromJson(String str) => HomeBannerModel.fromJson(json.decode(str));

String homeBannerModelToJson(HomeBannerModel data) => json.encode(data.toJson());

class HomeBannerModel {
    String message;
    List<Datum> data;

    HomeBannerModel({
        required this.message,
        required this.data,
    });

    factory HomeBannerModel.fromJson(Map<String, dynamic> json) => HomeBannerModel(
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
    String image;

    Datum({
        required this.id,
        required this.image,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: Id.fromJson(json["_id"]),
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "image": image,
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
