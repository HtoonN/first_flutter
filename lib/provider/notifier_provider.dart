import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends Notifier<List<String>> {
  //initial value
  @override
  List<String> build() {
    return ["two", 'one', 'four'];
  }

  //methods
  void addProduct(String data) {
    state = [...state, data];
  }
}

final productNotifierProvider =
    NotifierProvider<ProductNotifier, List<String>>(() {
  return ProductNotifier();
});
