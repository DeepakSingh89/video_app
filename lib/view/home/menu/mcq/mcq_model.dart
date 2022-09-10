// To parse this JSON data, do
//
//     final getMcqModel = getMcqModelFromJson(jsonString);

import 'dart:convert';

List<GetMcqModel> getMcqModelFromJson(String str) => List<GetMcqModel>.from(
    json.decode(str).map((x) => GetMcqModel.fromJson(x)));

String getMcqModelToJson(List<GetMcqModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMcqModel {
  GetMcqModel({
    this.id,
    this.title,
    this.qustion,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? title;
  List<String>? qustion;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory GetMcqModel.fromJson(Map<String, dynamic> json) => GetMcqModel(
        id: json["_id"],
        title: json["title"],
        qustion: List<String>.from(json["qustion"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "qustion": List<dynamic>.from(qustion!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
