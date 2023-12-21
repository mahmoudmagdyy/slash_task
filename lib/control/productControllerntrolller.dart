
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/productModel.dart';

class DetailController extends GetxController {
  int? id;

  @override
  void onInit() {
    getProduct();

    super.onInit();
  }


  getProduct() async {

    final url = Uri.parse('https://slash-backend.onrender.com/product');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        return DetailModel.fromJson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar("error", e.toString());
      }
    }
  }


}
