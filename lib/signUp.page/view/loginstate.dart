import 'package:laundry_app/signUp.page/Model/loginResModel.dart';

abstract class Loginstate {}

class LoginInitial extends Loginstate {}

class LoginLoading extends Loginstate {}

class LoginSuccess extends Loginstate {
  final LoginResModel response;
  LoginSuccess(this.response);
}

class LoginError extends Loginstate {
  final String message;
  LoginError(this.message);
}
