// To parse this JSON data, do
//
//     final getNotificationModel = getNotificationModelFromJson(jsonString);

import 'dart:convert';

List<GetNotificationModel> getNotificationModelFromJson(String str) =>
    List<GetNotificationModel>.from(
        json.decode(str).map((x) => GetNotificationModel.fromJson(x)));

String getNotificationModelToJson(List<GetNotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetNotificationModel {
  GetNotificationModel({
    this.id,
    this.notification,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? notification;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory GetNotificationModel.fromJson(Map<String, dynamic> json) =>
      GetNotificationModel(
        id: json["_id"],
        notification: json["notification"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "notification": notification,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
