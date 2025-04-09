import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_app/config/pretty.dio.dart';
import 'package:laundry_app/home/productController/productService.dart';
import 'package:laundry_app/home/productModel/productModel.dart';

final productProvider = FutureProvider<ProductModel>((ref) async {
  final productservice = ProductService(await createDio());
  return productservice.fetchProduct();
});
