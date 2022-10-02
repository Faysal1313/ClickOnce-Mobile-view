// ignore_for_file: camel_case_types

import '../../../models/login_modelc.dart';

abstract class Login_States {}

class Login_InitialState extends Login_States {}

//class Login_State extends Login_States {}

//class Login_BusinessState extends Login_States {}

class Login_LodingState extends Login_States {}

class Login_SuccessState extends Login_States {
//  final ShopLoginModel loginModel;
  final ClickLoginModel loginModel;

  Login_SuccessState(this.loginModel);
}

class LoginErrorState extends Login_States {
  final String error;
  LoginErrorState(this.error);
}

//================
//Customer
class tMain_Loading_Customer_states extends Login_States {}

class tMain_Success_Customer_states extends Login_States {}

class tMain_Error_Customer_states extends Login_States {}

class tMain_Customer_states extends Login_States {}

class tMain_CustomerErrorState extends Login_States {
  final String error;
  tMain_CustomerErrorState(this.error);
}
//================