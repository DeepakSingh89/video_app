// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommanLoader {
  static loader() {
    Get.defaultDialog(
        title: "",
        content: Column(
          children: [CircularProgressIndicator(), Text("Loading......")],
        ));
  }

  static hideLoader() {
    if (Get.isDialogOpen!) Get.back();
  }

  static message(String message) {
    Get.defaultDialog(
        title: "Something went wrong",
        content: Column(
          children: [Text(message)],
        ));
  }
}
