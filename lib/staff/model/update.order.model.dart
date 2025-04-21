// To parse this JSON data, do
//
//     final updatePerticulerOrder = updatePerticulerOrderFromJson(jsonString);

import 'dart:convert';

UpdatePerticulerOrder updatePerticulerOrderFromJson(String str) => UpdatePerticulerOrder.fromJson(json.decode(str));

String updatePerticulerOrderToJson(UpdatePerticulerOrder data) => json.encode(data.toJson());

class UpdatePerticulerOrder {
    bool iroing;
    bool deliverd;

    UpdatePerticulerOrder({
        required this.iroing,
        required this.deliverd,
    });

    factory UpdatePerticulerOrder.fromJson(Map<String, dynamic> json) => UpdatePerticulerOrder(
        iroing: json["iroing"],
        deliverd: json["deliverd"],
    );

    Map<String, dynamic> toJson() => {
        "iroing": iroing,
        "deliverd": deliverd,
    };
}


// To parse this JSON data, do
//
//     final updatePerticulerOrderResPonse = updatePerticulerOrderResPonseFromJson(jsonString);



UpdatePerticulerOrderResPonse updatePerticulerOrderResPonseFromJson(String str) => UpdatePerticulerOrderResPonse.fromJson(json.decode(str));

String updatePerticulerOrderResPonseToJson(UpdatePerticulerOrderResPonse data) => json.encode(data.toJson());

class UpdatePerticulerOrderResPonse {
    String message;

    UpdatePerticulerOrderResPonse({
        required this.message,
    });

    factory UpdatePerticulerOrderResPonse.fromJson(Map<String, dynamic> json) => UpdatePerticulerOrderResPonse(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
