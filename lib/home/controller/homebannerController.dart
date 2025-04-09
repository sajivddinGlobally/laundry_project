import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_app/config/pretty.dio.dart';
import 'package:laundry_app/home/controller/homebannerService.dart';
import 'package:laundry_app/home/model/homebannerModel.dart';

final homebannerProvider = FutureProvider<HomeBannerModel>((ref) async {
  final homebannerservice = HomebannerService(await createDio());
  return homebannerservice.getHomebanner();
});
