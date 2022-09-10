import 'package:get/get.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/login/login_screen.dart';

import '../services/api_client.dart';
import '../services/api_provider/reset_password_endpoint_provider.dart';

class ResetPasswordcontroller extends GetxController {
  GlobalKey<FormState> passwordresetformKey = GlobalKey<FormState>();
  TextEditingController code = TextEditingController();
  TextEditingController password = TextEditingController();

  String ? codeValiadation(value){
    if (value != code.text || value == '') {
      return 'Enter your mail code';

    }
    return null;
  }

  String ? confirmPassword(value){

  if (value.length <6) {
  return 'Password should more than 6 digits';

  }

    return null;
  }

 void checkPassword(){

   final isValidate = passwordresetformKey.currentState!.validate();
   if (!isValidate) {
     return ;
   } else {
     ResetApi();
     //Get.offAll(()=> LoginScreen());
   }

   passwordresetformKey.currentState!.save();
  }

  ResetApi(){
    Client _client = Client();
    ResetProvider _resetProvider = ResetProvider(client: _client.init());
    _resetProvider.resetApi(code.text,password.text);
  }


}