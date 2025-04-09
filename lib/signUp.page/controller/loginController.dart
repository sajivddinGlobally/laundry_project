import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_app/config/pretty.dio.dart';
import 'package:laundry_app/signUp.page/Model/loginBodyModel.dart';
import 'package:laundry_app/signUp.page/controller/loginService.dart';
import 'package:laundry_app/signUp.page/view/loginstate.dart';

class Logincontroller extends StateNotifier<Loginstate> {
  Logincontroller() : super(LoginInitial());

  Future<void> login(LoginBodyModel body) async {
    log("login started");

    try {
      state = LoginLoading();
      final dio = await createDio();
      final loginservice = LoginService(dio);
      final response = await loginservice.login(body);

      state = LoginSuccess(response);
      log("Login successfull ${response.toString()}");
    } catch (e) {
      state = LoginError(e.toString());
      log("Login Failed");
    }
  }
}

final loginProvider = StateNotifierProvider<Logincontroller, Loginstate>(
  (ref) => Logincontroller(),
);
