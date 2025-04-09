import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_app/config/pretty.dio.dart';
import 'package:laundry_app/home/getAllServiceControleller/getallService.dart';
import 'package:laundry_app/home/getallmodel/getAllServiceModel.dart';

final getAllProvider = FutureProvider<GetAllServiceModel>((ref) async {
  final getallservice = GetallService(await createDio());
  return getallservice.fetchAllService();
});

final popularServiceProvider = FutureProvider<GetAllServiceModel>((ref) async {
  final popularService = GetallService(await createDio());
  return popularService.getPopulerService();
});
