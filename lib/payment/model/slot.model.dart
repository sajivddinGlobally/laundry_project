// To parse this JSON data, do
//
//     final slotsModel = slotsModelFromJson(jsonString);

import 'dart:convert';

SlotsModel slotsModelFromJson(String str) => SlotsModel.fromJson(json.decode(str));

String slotsModelToJson(SlotsModel data) => json.encode(data.toJson());

class SlotsModel {
    List<Datum> data;
    String message;

    SlotsModel({
        required this.data,
        required this.message,
    });

    factory SlotsModel.fromJson(Map<String, dynamic> json) => SlotsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    String id;
    String startTime;
    String endtime;
    bool pickup;

    Datum({
        required this.id,
        required this.startTime,
        required this.endtime,
        required this.pickup,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        startTime: json["startTime"],
        endtime: json["endtime"],
        pickup: json["pickup"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "startTime": startTime,
        "endtime": endtime,
        "pickup": pickup,
    };
}


