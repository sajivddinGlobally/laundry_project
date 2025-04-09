// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) => LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
    String message;
    Data data;

    LoginResModel({
        required this.message,
        required this.data,
    });

    factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Id id;
    String name;
    String email;
    String phoneNumber;
    String countryCode;
    String currentAddress;
    double latitude;
    double longitude;
    String profilePicUrl;

    Data({
        required this.id,
        required this.name,
        required this.email,
        required this.phoneNumber,
        required this.countryCode,
        required this.currentAddress,
        required this.latitude,
        required this.longitude,
        required this.profilePicUrl,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: Id.fromJson(json["_id"]),
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        countryCode: json["country_code"],
        currentAddress: json["current_address"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        profilePicUrl: json["profile_pic_url"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "country_code": countryCode,
        "current_address": currentAddress,
        "latitude": latitude,
        "longitude": longitude,
        "profile_pic_url": profilePicUrl,
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
