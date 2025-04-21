// To parse this JSON data, do
//
//     final userRegisterModel = userRegisterModelFromJson(jsonString);

import 'dart:convert';

UserRegisterModel userRegisterModelFromJson(String str) => UserRegisterModel.fromJson(json.decode(str));

String userRegisterModelToJson(UserRegisterModel data) => json.encode(data.toJson());

class UserRegisterModel {
    String name;

    String phoneNumber;
    String countryCode;
    String currentAddress;
    String profilePicUrl;

    UserRegisterModel({
        required this.name,

        required this.phoneNumber,
        required this.countryCode,
        required this.currentAddress,
        required this.profilePicUrl,
    });

    factory UserRegisterModel.fromJson(Map<String, dynamic> json) => UserRegisterModel(
        name: json["name"],

        phoneNumber: json["phone_number"],
        countryCode: json["country_code"],
        currentAddress: json["current_address"],
        profilePicUrl: json["profile_pic_url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,

        "phone_number": phoneNumber,
        "country_code": countryCode,
        "current_address": currentAddress,
        "profile_pic_url": profilePicUrl,
    };
}
