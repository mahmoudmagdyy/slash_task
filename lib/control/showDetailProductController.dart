
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/productDetailModel.dart';

class Service extends GetxController{

  Product? _product;

  Product? get product => _product;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
  }





  Future<Product> fetchProduct(int id) async {
    final response = await http.get(Uri.parse('https://slash-backend.onrender.com/product/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      _product = Product.fromJson(data['data']);
      update();
      return Product.fromJson(data['data']);
    } else {
      throw Exception('Failed to load product');
    }

  }



  void fetchData(int id) async {
    try {
      final response = await http.get(
        Uri.parse('https://slash-backend.onrender.com/product/$id'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final Product product = Product.fromJson(data['data']);
        productList.value = [product];
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }


}