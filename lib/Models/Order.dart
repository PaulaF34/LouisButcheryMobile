class Order {
  final int id;
  final double total;
  final String status;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.total,
    required this.status,
    required this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      total: (json['total'] as num).toDouble(),
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
