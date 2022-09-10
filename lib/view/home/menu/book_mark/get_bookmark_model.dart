// To parse this JSON data, do
//
//     final getbookmarkModel = getbookmarkModelFromJson(jsonString);

import 'dart:convert';

List<GetbookmarkModel> getbookmarkModelFromJson(String str) =>
    List<GetbookmarkModel>.from(
        json.decode(str).map((x) => GetbookmarkModel.fromJson(x)));

String getbookmarkModelToJson(List<GetbookmarkModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetbookmarkModel {
  GetbookmarkModel({
    this.id,
    this.name,
    this.instructor,
    this.courseImg,
    this.courseVideo,
    this.v,
  });

  String? id;
  String? name;
  String? instructor;
  String? courseImg;
  String? courseVideo;
  int? v;

  factory GetbookmarkModel.fromJson(Map<String, dynamic> json) =>
      GetbookmarkModel(
        id: json["_id"],
        name: json["name"],
        instructor: json["instructor"],
        courseImg: json["CourseImg"],
        courseVideo: json["courseVideo"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "instructor": instructor,
        "CourseImg": courseImg,
        "courseVideo": courseVideo,
        "__v": v,
      };
}
