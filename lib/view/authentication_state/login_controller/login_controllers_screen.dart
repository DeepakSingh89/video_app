// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
// import '../authentication_controller/authentication_controllers.dart';
//
// class LoginController  extends GetxController {
//   final AuthenticationController _authenticationController = Get.find();
//
//   final _loginStateStream = LoginState().obs;
//   final _signupstateStream = SignupState().obs;
//
//   LoginState get state => _loginStateStream.value;
//   SignUpState get state => _signupstateStream.value;
//
//   void login(String email, String password) async {
//     _loginStateStream.value = LoginLoading();
//
//
//
//     try{
//       await _authenticationController.signIn(email, password);
//       _loginStateStream.value = LoginState();
//     } on AuthenticationException catch(e){
//       _loginStateStream.value = LoginFailure(error: e.message);
//     }
//   }
// }
//
// mixin LoginState {
// }