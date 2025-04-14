import 'package:dio/dio.dart';
import 'package:laundry_app/home/getallmodel/getAllServiceModel.dart';
import 'package:laundry_app/payment/model/slot.model.dart';
import 'package:retrofit/retrofit.dart';

part 'payment.service.g.dart';

@RestApi(baseUrl: 'https://rl4km84x-8000.inc1.devtunnels.ms')
abstract class PaymentService {
  factory PaymentService(Dio dio, {String baseUrl}) = _PaymentService;

  @GET('/api/get-slot')
  Future<SlotsModel> fetchSlots();

}
