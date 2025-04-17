import 'dart:convert';

class User {
  final String? name;
  final String? address;
  final String email;
  final String? phone;
  final String? password;
  final String role;

  User({
    this.name,
    this.address,
    required this.email,
    this.phone,
    this.password,
    this.role = 'customer',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'email': email,
      'phone': phone,
      'password': password,
      'role': role,
    };
  }

  String toJson() => json.encode(toMap());
}

