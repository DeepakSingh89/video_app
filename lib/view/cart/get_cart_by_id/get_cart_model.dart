// To parse this JSON data, do
//
//     final getCartModel = getCartModelFromJson(jsonString);

import 'dart:convert';

import 'package:raghu_education/view/home/home_page/home_module/get_all_course_model.dart';

GetCartModel getCartModelFromJson(String str) =>
    GetCartModel.fromJson(json.decode(str));

String getCartModelToJson(GetCartModel data) => json.encode(data.toJson());

class GetCartModel {
  GetCartModel({
    this.id,
    this.user,
    this.course,
    this.createdAt,
    this.updatedAt,
    this.v,
    //this.couponApplied,
  });

  String? id;
  String? user;
  List<GetCourseModel>? course;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  //CouponApplied? couponApplied;

  factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
        id: json["_id"],
        user: json["user"],
        course: List<GetCourseModel>.from(
            json["course"].map((x) => GetCourseModel.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        //couponApplied: CouponApplied.fromJson(json["coupon_applied"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "course": List<dynamic>.from(course!.map((x) => x.toJson())),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        //"coupon_applied": couponApplied!.toJson(),
      };
}

class CouponApplied {
  CouponApplied({
    this.id,
    this.couponamont,
  });

  String? id;
  String? couponamont;

  factory CouponApplied.fromJson(Map<String, dynamic> json) => CouponApplied(
        id: json["_id"],
        couponamont: json["couponamont"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "couponamont": couponamont,
      };
}
