import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:raghu_education/api%20provider/api_client.dart';
//import 'package:raghu_education/api%20provider/providers/registor_endpoint_provider.dart';
import 'package:raghu_education/import_files.dart';
import 'package:flutter/material.dart';
import 'package:raghu_education/services/api_client.dart';

import '../../../services/api_provider/put_update_user_endpoint_provider.dart';
//import 'package:raghu_education/view/signUp/verify/verify.dart';

class ProfileeditController extends GetxController {
  Rx<File> myField = File('').obs;
  //String imagePath;
  final _picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      myField.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  GlobalKey<FormState> editProfilekey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  void onInit() {
    name;
    phone;
    address;
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    address.dispose();
    super.dispose();
  }

  String? phonevalidation(value) {
    if (value == '') {
      return 'enter your number';
    }
    return null;
  }

  String? namevalidation(value) {
    if (value == '') {
      return 'enter your name';
    }
    return null;
  }

  String? addressvalidation(value) {
    if (value == '') {
      return 'enter your address';
    }
    return null;
  }

  checkuserupdate() {
    final isvalidate = editProfilekey.currentState!.validate();
    if (!isvalidate) {
      return;
    } else {
      calleditprofileApi();
    }
    editProfilekey.currentState!.save();
  }

  calleditprofileApi() {
    Client _client = Client();
    EditProfileEndPoint _editprofile =
        EditProfileEndPoint(client: _client.init());
    _editprofile.putupdateprofileApi(
        name.text, myField.value.path, phone.text, address.text);
  }
}
