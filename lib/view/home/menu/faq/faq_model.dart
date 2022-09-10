// To parse this JSON data, do
//
//     final getFaqModel = getFaqModelFromJson(jsonString);

import 'dart:convert';

List<GetFaqModel> getFaqModelFromJson(String str) => List<GetFaqModel>.from(
    json.decode(str).map((x) => GetFaqModel.fromJson(x)));

String getFaqModelToJson(List<GetFaqModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetFaqModel {
  GetFaqModel({
    this.id,
    this.title,
    this.answer,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? title;
  List<String>? answer;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory GetFaqModel.fromJson(Map<String, dynamic> json) => GetFaqModel(
        id: json["_id"],
        title: json["title"],
        answer: List<String>.from(json["answer"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "answer": List<dynamic>.from(answer!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
