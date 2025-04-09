import 'package:dio/dio.dart';
import 'package:laundry_app/home/model/homebannerModel.dart';
import 'package:retrofit/retrofit.dart';

part 'homebannerService.g.dart';

@RestApi(baseUrl: 'https://rl4km84x-8000.inc1.devtunnels.ms')
abstract class HomebannerService {
  factory HomebannerService(Dio dio, {String baseUrl}) = _HomebannerService;

  @GET('/api/get-all-banners')
  Future<HomeBannerModel> getHomebanner();
}
