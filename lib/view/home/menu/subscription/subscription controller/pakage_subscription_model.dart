// To parse this JSON data, do
//
//     final getPackageModel = getPackageModelFromJson(jsonString);

import 'dart:convert';

List<GetPackageModel> getPackageModelFromJson(String str) =>
    List<GetPackageModel>.from(
        json.decode(str).map((x) => GetPackageModel.fromJson(x)));

String getPackageModelToJson(List<GetPackageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetPackageModel {
  GetPackageModel({
    this.id,
    this.price,
    this.descrption,
    this.package,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  int? price;
  String? descrption;
  String? package;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory GetPackageModel.fromJson(Map<String, dynamic> json) =>
      GetPackageModel(
        id: json["_id"],
        price: json["price"],
        descrption: json["descrption"],
        package: json["package"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "price": price,
        "descrption": descrption,
        "package": package,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
