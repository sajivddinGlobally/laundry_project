import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_app/config/pretty.dio.dart';
import 'package:laundry_app/home/controller/homebannerService.dart';
import 'package:laundry_app/home/getAllServiceControleller/getallService.dart'
    show GetallService;
import 'package:laundry_app/home/getallmodel/getAllServiceModel.dart';
import 'package:laundry_app/home/model/homebannerModel.dart';
import 'package:laundry_app/home/productController/productService.dart';
import 'package:laundry_app/home/productModel/productModel.dart';

class HomeState {
  final HomeBannerModel? banners;
  final GetAllServiceModel? services;
  final GetAllServiceModel? popularServices;
  final ProductModel? products;
  final bool isLoading;
  final String? error;

  HomeState({
    this.banners,
    this.services,
    this.popularServices,
    this.products,
    this.isLoading = false,
    this.error,
  });

  HomeState copyWith({
    HomeBannerModel? banners,
    GetAllServiceModel? services,
    GetAllServiceModel? popularServices,
    ProductModel? products,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      banners: banners ?? this.banners,
      services: services ?? this.services,
      popularServices: popularServices ?? this.popularServices,
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState());

  Future<void> fetchAllData() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      // API calls using Future.wait with compute
      final results = await Future.wait([
        compute(fetchHomeBanners, null),
        compute(fetchAllServices, null),
        compute(fetchPopularServices, null),
        compute(fetchProducts, null),
      ]);

      // Assign results
      final banners = results[0] as HomeBannerModel;
      final services = results[1] as GetAllServiceModel;
      final popularServices = results[2] as GetAllServiceModel;
      final products = results[3] as ProductModel;

      state = state.copyWith(
        banners: banners,
        services: services,
        popularServices: popularServices,
        products: products,
        isLoading: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

// Functions to be used with compute
Future<HomeBannerModel> fetchHomeBanners(dynamic _) async {
  final homebannerservice = HomebannerService(await createDio());
  return homebannerservice.getHomebanner();
}

Future<GetAllServiceModel> fetchAllServices(dynamic _) async {
  final getallservice = GetallService(await createDio());
  return getallservice.fetchAllService();
}

Future<GetAllServiceModel> fetchPopularServices(dynamic _) async {
  final popularService = GetallService(await createDio());
  return popularService.getPopulerService();
}

Future<ProductModel> fetchProducts(dynamic _) async {
  final productservice = ProductService(await createDio());
  return productservice.fetchProduct();
}

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});