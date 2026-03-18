import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_state_management/models/products.dart';

class ProductNotifer extends Notifier<Products> {
  @override
  Products build() {
    return Products(name: "Tomatos", price: 5000);
  }

  void changeName(String name) {
    state = state.copyWith(name: name);
  }

  void changePrice() {
    state = state.copyWith(price: state.price * 0.1);
  }
}

final productProvider = NotifierProvider<ProductNotifer, Products>(
  () => ProductNotifer(),
);
