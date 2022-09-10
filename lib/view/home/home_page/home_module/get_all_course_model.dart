// To parse this JSON data, do
//
//     final getCourseModel = getCourseModelFromJson(jsonString);

import 'dart:convert';

List<GetCourseModel> getCourseModelFromJson(String str) =>
    List<GetCourseModel>.from(
        json.decode(str).map((x) => GetCourseModel.fromJson(x)));

String getCourseModelToJson(List<GetCourseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCourseModel {
  GetCourseModel({
    required this.id,
    required this.name,
    required this.instructor,
    required this.courseImg,
    required this.totelTimeOfCourse,
    required this.lecture,
    required this.price,
    required this.descrption,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
     this.rating,
  });

  String id;
  String name;
  String instructor;
  String courseImg;
  String totelTimeOfCourse;
  List<Lecture> lecture;
  int price;
  String descrption;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int? rating;

  factory GetCourseModel.fromJson(Map<String, dynamic> json) => GetCourseModel(
        id: json["_id"],
        name: json["name"],
        instructor: json["instructor"],
        courseImg: json["CourseImg"],
        totelTimeOfCourse: json["totelTimeOfCourse"] == null
            ? null
            : json["totelTimeOfCourse"],
        lecture:
            List<Lecture>.from(json["lecture"].map((x) => Lecture.fromJson(x))),
        price: json["price"],
        descrption: json["descrption"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        rating: json["rating"] == null ? null : json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "instructor": instructor,
        "CourseImg": courseImg,
        "totelTimeOfCourse":
            totelTimeOfCourse == null ? null : totelTimeOfCourse,
        "lecture": List<dynamic>.from(lecture.map((x) => x.toJson())),
        "price": price,
        "descrption": descrption,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "rating": rating == null ? null : rating,
      };
}

class Lecture {
  Lecture({
    required this.contentType,
    required this.content,
    required this.title,
  });

  String contentType;
  String content;
  String title;

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
        contentType: json["contentType"],
        content: json["content"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "contentType": contentType,
        "content": content,
        "title": title == null ? null : title,
      };
}
