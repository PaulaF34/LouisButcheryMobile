import 'package:get/get.dart';
import 'package:louisbutcheryapp/Core/Network/DioClient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Routes/AppRoute.dart';

class HomeController extends GetxController {
  var products = [].obs;
  var filteredProducts = [].obs;
  var categories = <String>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      final dio = DioClient().dio; // ✅ Correct usage
      final response = await dio.get('/products'); // assumes baseUrl = /api

      if (response.statusCode == 200) {
        products.value = response.data;
        filteredProducts.assignAll(products);
        extractCategories();
        print(response.data);
      } else {
        print('Unexpected status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading(false);
    }
  }

  void extractCategories() {
    final uniqueCategories = products
        .map((p) => p['category'])
        .whereType<String>()
        .toSet()
        .toList();
    categories.assignAll(uniqueCategories);
  }

  void filterByCategory(String category) {
    filteredProducts.value =
        products.where((p) => p['category'] == category).toList();
  }

  void clearCategory() {
    filteredProducts.assignAll(products);
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Get.offAllNamed(AppRoute.login);
  }
}
