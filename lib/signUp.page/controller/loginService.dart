import 'package:dio/dio.dart';
import 'package:laundry_app/signUp.page/Model/loginBodyModel.dart';
import 'package:laundry_app/signUp.page/Model/loginResModel.dart';
import 'package:retrofit/retrofit.dart';

part 'loginService.g.dart';

@RestApi(baseUrl: 'https://rl4km84x-8000.inc1.devtunnels.ms')
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST('/api/login')
  Future<LoginResModel> login(@Body() LoginBodyModel body);
}
