import 'package:flutter_riverpod/flutter_riverpod.dart';

const List<String> product = ["one", "two", "three"];

final productProvider = Provider((ref) {
  return product;
});
