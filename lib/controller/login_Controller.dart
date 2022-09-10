
import 'package:get/get.dart';
import 'package:raghu_education/import_files.dart';
import '../services/api_client.dart';
import '../services/api_provider/login_api.dart';

class LoginController extends GetxController {



  GlobalKey<FormState> signinkey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();




  String ? emailvalidation(value){
    if(value == ''){
      return 'enter your email';
    }
    return null;
  }
  String ? passwordvalidation(value){
    if(value == ''){
      return 'enter your password';
    }
    return null;
  }
  checklogin() {
    final isvalidate = signinkey.currentState!.validate();
    if (!isvalidate) {
      return;
    }
    else {
      callSignApi();
    }
    signinkey.currentState!.save();
  }

  callSignApi(){
    Client _client = Client();
    SignInProvider _signinProvider = SignInProvider(client: _client.init());
    _signinProvider.signinApi(email.text, password.text);
  }

}