import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/Model/user_data.dart';

class ProductNotifier extends Notifier<UserData> {
  UserData user = UserData(name: 'Username');
  //initial value
  @override
  UserData build() {
    return user;
  }

  //methods
  void addProduct(String data) {
    user.name = data;
  }
}

final inputNotiProvider = NotifierProvider<ProductNotifier, UserData>(() {
  return ProductNotifier();
});
