// To parse this JSON data, do
//
//     final getUserModel = getUserModelFromJson(jsonString);

import 'dart:convert';

GetUserModel getUserModelFromJson(String str) =>
    GetUserModel.fromJson(json.decode(str));

String getUserModelToJson(GetUserModel data) => json.encode(data.toJson());

class GetUserModel {
  GetUserModel({
    this.id,
    this.name,
    this.email,
    this.hashPassword,
    this.avatar,
    this.address,
    this.phone,
    this.v,
  });

  String? id;
  String? name;
  String? email;
  String? hashPassword;
  String? avatar;
  String? address;
  int? phone;
  int? v;

  factory GetUserModel.fromJson(Map<String, dynamic> json) => GetUserModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        hashPassword: json["hash_password"],
        avatar: json["avatar"],
        address: json["address"],
        phone: json["phone"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "hash_password": hashPassword,
        "avatar": avatar,
        "address": address,
        "phone": phone,
        "__v": v,
      };
}
