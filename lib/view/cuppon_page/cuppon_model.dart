// To parse this JSON data, do
//
//     final getCupponModel = getCupponModelFromJson(jsonString);

import 'dart:convert';

List<GetCupponModel> getCupponModelFromJson(String str) =>
    List<GetCupponModel>.from(
        json.decode(str).map((x) => GetCupponModel.fromJson(x)));

String getCupponModelToJson(List<GetCupponModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCupponModel {
  GetCupponModel({
    this.id,
    this.couponCode,
    this.couponamont,
    this.expires,
    this.v,
  });

  String? id;
  String? couponCode;
  String? couponamont;
  DateTime? expires;
  int? v;

  factory GetCupponModel.fromJson(Map<String, dynamic> json) => GetCupponModel(
        id: json["_id"],
        couponCode: json["couponCode"],
        couponamont: json["couponamont"],
        expires: DateTime.parse(json["expires"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "couponCode": couponCode,
        "couponamont": couponamont,
        "expires": expires!.toIso8601String(),
        "__v": v,
      };
}
