// To parse this JSON data, do
//
//     final userRegisterResModel = userRegisterResModelFromJson(jsonString);

import 'dart:convert';

UserRegisterResModel userRegisterResModelFromJson(String str) => UserRegisterResModel.fromJson(json.decode(str));

String userRegisterResModelToJson(UserRegisterResModel data) => json.encode(data.toJson());

class UserRegisterResModel {
    String message;

    UserRegisterResModel({
        required this.message,
    });

    factory UserRegisterResModel.fromJson(Map<String, dynamic> json) => UserRegisterResModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
