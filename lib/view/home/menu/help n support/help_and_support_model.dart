// To parse this JSON data, do
//
//     final getHelpSupportModel = getHelpSupportModelFromJson(jsonString);

import 'dart:convert';

List<GetHelpSupportModel> getHelpSupportModelFromJson(String str) =>
    List<GetHelpSupportModel>.from(
        json.decode(str).map((x) => GetHelpSupportModel.fromJson(x)));

String getHelpSupportModelToJson(List<GetHelpSupportModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetHelpSupportModel {
  GetHelpSupportModel({
    this.id,
    this.address,
    this.contact,
    this.mail,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? address;
  int? contact;
  String? mail;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory GetHelpSupportModel.fromJson(Map<String, dynamic> json) =>
      GetHelpSupportModel(
        id: json["_id"],
        address: json["address"],
        contact: json["contact"],
        mail: json["mail"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "address": address,
        "contact": contact,
        "mail": mail,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
