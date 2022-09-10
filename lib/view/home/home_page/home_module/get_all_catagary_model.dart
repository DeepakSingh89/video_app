// To parse this JSON data, do
//
//     final getCatagaryModel = getCatagaryModelFromJson(jsonString);

import 'dart:convert';

List<GetCatagaryModel> getCatagaryModelFromJson(String str) => List<GetCatagaryModel>.from(json.decode(str).map((x) => GetCatagaryModel.fromJson(x)));

String getCatagaryModelToJson(List<GetCatagaryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCatagaryModel {
  GetCatagaryModel({
    this.id,
    this.category,
    this.categoryImg,
    this.v,
  });

  String ?id;
  String ?category;
  String ?categoryImg;
  int ?v;

  factory GetCatagaryModel.fromJson(Map<String, dynamic> json) => GetCatagaryModel(
    id: json["_id"],
    category: json["category"],
    categoryImg: json["CategoryImg"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "category": category,
    "CategoryImg": categoryImg,
    "__v": v,
  };
}
