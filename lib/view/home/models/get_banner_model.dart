// To parse this JSON data, do
//
//     final getBannerModel = getBannerModelFromJson(jsonString);

import 'dart:convert';

List<GetBannerModel> getBannerModelFromJson(String str) => List<GetBannerModel>.from(json.decode(str).map((x) => GetBannerModel.fromJson(x)));

String getBannerModelToJson(List<GetBannerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetBannerModel {
  GetBannerModel({
    this.id,
    this.banner,
    this.v,
  });

  String? id;
  String? banner;
  int ?v;

  factory GetBannerModel.fromJson(Map<String, dynamic> json) => GetBannerModel(
    id: json["_id"],
    banner: json["banner"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "banner": banner,
    "__v": v,
  };
}
