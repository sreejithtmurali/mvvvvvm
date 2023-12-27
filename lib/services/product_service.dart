// services/product_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvvvvm/model/RespMain.dart';

import '../model/Products.dart';

class ProductService {
  final String apiUrl = "https://dummyjson.com/products";

  Future<List<Products>?> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
     var data = json.decode(response.body);
     var res=RespMain.fromJson(data);
     var list= res.products;
     return list;
    } else {
      throw Exception("Failed to load products");
    }
  }
}
