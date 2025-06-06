import 'package:get/get.dart';
import 'package:louisbutcheryapp/Core/Network/DioClient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Routes/AppRoute.dart';

class HomeController extends GetxController {
  var products = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      final response = await DioClient().getInstance().get('/products');

      if (response.statusCode == 200) {
        products.value = response.data;
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading(false);
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Get.offAllNamed(AppRoute.login); // or AppRoute.welcome
  }

}
