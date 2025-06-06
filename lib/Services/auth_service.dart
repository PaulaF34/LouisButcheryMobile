import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String baseUrl = 'http://192.168.1.22:8000/api/auth'; // ✅ Fixed base URL

  static Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'), // ✅ Correct endpoint
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', data['token']);
      return true;
    } else {
      final data = jsonDecode(response.body);
      print('Login failed: ${data['message']}');
      return false;
    }
  }

  static Future<bool> register(String name, String address, String phone, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'name': name,
        'address': address,
        'phone': phone,
        'email': email,
        'password': password,
        'role': 'customer',
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', data['token']);
      return true;
    } else {
      final data = jsonDecode(response.body);
      print('Registration failed: ${data['message']}');
      return false;
    }
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      final response = await http.post(
        Uri.parse('$baseUrl/logout'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        await prefs.remove('token');
      } else {
        print('Logout failed: ${response.statusCode}');
      }
    }
  }

  static Future<bool> checkConnection() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/check'));
      if (response.statusCode == 200) {
        return true;
      } else {
        print('Connection check failed: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Connection error: $e');
      return false;
    }
  }
}
