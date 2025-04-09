import 'package:dio/dio.dart';
import 'package:laundry_app/home/productModel/productModel.dart';
import 'package:retrofit/retrofit.dart';

part 'productService.g.dart';

@RestApi(baseUrl: 'https://rl4km84x-8000.inc1.devtunnels.ms')
abstract class ProductService {
  factory ProductService(Dio dio, {String baseUrl}) = _ProductService;

  @GET('/api/get-products')
  Future<ProductModel> fetchProduct();
}
