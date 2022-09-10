// To parse this JSON data, do
//
//     final getSearchModel = getSearchModelFromJson(jsonString);

import 'dart:convert';

List<GetSearchModel> getSearchModelFromJson(String str) =>
    List<GetSearchModel>.from(
        json.decode(str).map((x) => GetSearchModel.fromJson(x)));

String getSearchModelToJson(List<GetSearchModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetSearchModel {
  GetSearchModel({
    this.id,
    this.name,
    this.instructor,
    this.courseImg,
    this.courseVideo,
    this.v,
    this.price,
  });

  String? id;
  String? name;
  String? instructor;
  String? courseImg;
  String? courseVideo;
  int? v;
  int? price;

  factory GetSearchModel.fromJson(Map<String, dynamic> json) => GetSearchModel(
        id: json["_id"],
        name: json["name"],
        instructor: json["instructor"],
        courseImg: json["CourseImg"],
        courseVideo: json["courseVideo"],
        v: json["__v"],
        price: json["price"] == null ? null : json["price"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "instructor": instructor,
        "CourseImg": courseImg,
        "courseVideo": courseVideo,
        "__v": v,
        "price": price == null ? null : price,
      };
}
