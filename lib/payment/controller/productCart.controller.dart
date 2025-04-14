import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_app/payment/model/createOrder.model.dart';


// Replace with the actual path to your model file

class OrderCreateNotifier extends StateNotifier<OrderCreateModel?> {
  OrderCreateNotifier() : super(null);

  void createOrder({
    required String userId,
    required String trxId,
    required String paymentTyp,
    required int totalBookedAmount,
    required List<Product> products,
  }) {
    state = OrderCreateModel(
      userid: userId,
      trxId: trxId,
      paymentTyp: paymentTyp,
      totalBookedAmount: totalBookedAmount,
      product: products,
    );
  }

  void updateTrxId(String trxId) {
    if (state != null) {
      state = OrderCreateModel(
        userid: state!.userid,
        trxId: trxId,
        paymentTyp: state!.paymentTyp,
        totalBookedAmount: state!.totalBookedAmount,
        product: state!.product,
      );
    }
  }

  void updatePaymentType(String paymentType) {
    if (state != null) {
      state = OrderCreateModel(
        userid: state!.userid,
        trxId: state!.trxId,
        paymentTyp: paymentType,
        totalBookedAmount: state!.totalBookedAmount,
        product: state!.product,
      );
    }
  }
  void updateTrnx(String paymentType) {
    if (state != null) {
      state = OrderCreateModel(
        userid: state!.userid,
        trxId: paymentType,
        paymentTyp: state!.paymentTyp,
        totalBookedAmount: state!.totalBookedAmount,
        product: state!.product,
      );
    }
  }

  void addProduct(Product product) {
    if (state != null) {
      final updatedProducts = List<Product>.from(state!.product)..add(product);
      state = OrderCreateModel(
        userid: state!.userid,
        trxId: state!.trxId,
        paymentTyp: state!.paymentTyp,
        totalBookedAmount: state!.totalBookedAmount,
        product: updatedProducts,
      );
    }
  }

  void removeProductById(String productId) {
    if (state != null) {
      final updatedProducts =
          state!.product.where((p) => p.productId != productId).toList();
      state = OrderCreateModel(
        userid: state!.userid,
        trxId: state!.trxId,
        paymentTyp: state!.paymentTyp,
        totalBookedAmount: state!.totalBookedAmount,
        product: updatedProducts,
      );
    }
  }

  void clearOrder() {
    state = null;
  }
}

// A simple StateNotifier that holds a String state
final orderCreateProvider =
    StateNotifierProvider<OrderCreateNotifier, OrderCreateModel?>(
      (ref) => OrderCreateNotifier(),
    );

class AdreessStateNotifer extends StateNotifier<String> {
  AdreessStateNotifer() : super("");

  void update(String value) {
    state = value;
  }

  void clear() {
    state = "";
  }
}

final addressStateNotifer = StateNotifierProvider<AdreessStateNotifer, String>(
  (ref) => AdreessStateNotifer(),
);
