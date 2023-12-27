// viewmodels/product_viewmodel.dart

import 'package:stacked/stacked.dart';


import '../model/Products.dart';
import '../services/product_service.dart';

class ProductViewModel extends BaseViewModel {
  final _productService = ProductService();
  List<Products> _products = [];

  List<Products> get products => _products;

  Future<void> fetchProducts() async {
    setBusy(true);
    try {
      _products = (await _productService.fetchProducts())!;
      notifyListeners();
    } catch (error) {
      // Handle error (show a message or log it)
      print(error);
    } finally {
      setBusy(false);
    }
  }
}
