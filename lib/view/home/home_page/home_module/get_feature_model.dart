// To parse this JSON data, do
//
//     final getFeatureModel = getFeatureModelFromJson(jsonString);

import 'dart:convert';

List<GetFeatureModel> getFeatureModelFromJson(String str) => List<GetFeatureModel>.from(json.decode(str).map((x) => GetFeatureModel.fromJson(x)));

String getFeatureModelToJson(List<GetFeatureModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetFeatureModel {
  GetFeatureModel({
    this.id,
    this.name,
    this.instructor,
    this.courseImg,
    this.rating,
    this.v,
  });

  String ?id;
  String ?name;
  String ?instructor;
  String ?courseImg;
  String ?rating;
  int ?v;

  factory GetFeatureModel.fromJson(Map<String, dynamic> json) => GetFeatureModel(
    id: json["_id"],
    name: json["name"],
    instructor: json["instructor"],
    courseImg: json["CourseImg"],
    rating: json["rating"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "instructor": instructor,
    "CourseImg": courseImg,
    "rating": rating,
    "__v": v,
  };
}
