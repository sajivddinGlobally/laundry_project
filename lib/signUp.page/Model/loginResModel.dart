// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) => LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
    String message;
    Data data;
    int otp;
    LoginResModel({
      required this.otp,
        required this.message,
        required this.data,
    });

    factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
      otp: json["otp"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "otp": otp,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Id id;
    String name;

    String phoneNumber;
    String countryCode;
    String currentAddress;
    bool staff;
    String profilePicUrl;

    Data({
        required this.id,
        required this.name,

        required this.phoneNumber,
        required this.countryCode,
        required this.currentAddress,
required this.staff,
        required this.profilePicUrl,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: Id.fromJson(json["_id"]),
        name: json["name"],

        staff: json["staff"],
        phoneNumber: json["phone_number"],
        countryCode: json["country_code"],
        currentAddress: json["current_address"],

        profilePicUrl: json["profile_pic_url"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "name": name,
        "phone_number": phoneNumber,
        "country_code": countryCode,
        "current_address": currentAddress,
        "staff": staff,
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
