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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'email': email,
      'phone': phone,
      'password': password,
      'role': role,
    };
  }
}


