import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_app/config/pretty.dio.dart';
import 'package:laundry_app/home/productController/productService.dart';
import 'package:laundry_app/payment/model/slot.model.dart';
import 'package:laundry_app/payment/service/payment.service.dart';

final slotProvider = FutureProvider<SlotsModel>((ref){
  final serice = PaymentService(createDio());
  return serice.fetchSlots();
});