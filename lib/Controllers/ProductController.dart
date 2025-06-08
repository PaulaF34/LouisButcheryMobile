import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/Product.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var selectedCategory = ''.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    final response = await http.get(Uri.parse('http://198.162.1.24/api/products'));
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      products.value = result.map((e) => Product.fromJson(e)).toList();
    }
  }

  List<Product> get filteredProducts {
    if (selectedCategory.value.isEmpty) {
      return products;
    }
    return products.where((p) => p.category == selectedCategory.value).toList();
  }

  void setCategory(String category) {
    selectedCategory.value = category;
  }

  void clearCategory() {
    selectedCategory.value = '';
  }
}
