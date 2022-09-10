// To parse this JSON data, do
//
//     final getratingrivewModel = getratingrivewModelFromJson(jsonString);

import 'dart:convert';

List<GetratingrivewModel> getratingrivewModelFromJson(String str) =>
    List<GetratingrivewModel>.from(
        json.decode(str).map((x) => GetratingrivewModel.fromJson(x)));

String getratingrivewModelToJson(List<GetratingrivewModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetratingrivewModel {
  GetratingrivewModel({
    required this.id,
    required this.user,
    required this.rating,
    required this.courseId,
    required this.review,
    required this.v,
  });

  String id;
  User user;
  int rating;
  String courseId;
  String review;
  int v;

  factory GetratingrivewModel.fromJson(Map<String, dynamic> json) =>
      GetratingrivewModel(
        id: json["_id"],
        user: User.fromJson(json["user"]),
        rating: json["rating"],
        courseId: json["courseId"],
        review: json["review"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user.toJson(),
        "rating": rating,
        "courseId": courseId,
        "review": review,
        "__v": v,
      };
}

class User {
  User({
    required this.id,
    required this.name,
    this.avatar,
  });

  String id;
  String name;
  String? avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "avatar": avatar,
      };
}
