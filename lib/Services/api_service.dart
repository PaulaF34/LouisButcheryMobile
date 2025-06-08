import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:louisbutcheryapp/Models/Product.dart';
import 'package:louisbutcheryapp/Models/Order.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.1.24:8000/api';

  static Future<List<Order>> fetchOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      Uri.parse('$baseUrl/orders'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List data = jsonData is List ? jsonData : jsonData['orders'];
      return data.map((item) => Order.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }

  static Future<List<Product>> fetchProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      Uri.parse('$baseUrl/products'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List data = jsonData is List ? jsonData : jsonData['products'];
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
