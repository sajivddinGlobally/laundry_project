import 'package:dio/dio.dart';
import 'package:laundry_app/home/getallmodel/getAllServiceModel.dart';
import 'package:retrofit/retrofit.dart';

part 'getallService.g.dart';

@RestApi(baseUrl: 'https://rl4km84x-8000.inc1.devtunnels.ms')
abstract class GetallService {
  factory GetallService(Dio dio, {String baseUrl}) = _GetallService;

  @GET('/api/get-all-service')
  Future<GetAllServiceModel> fetchAllService();

  @GET('/api/populer-service')
  Future<GetAllServiceModel> getPopulerService();
}
