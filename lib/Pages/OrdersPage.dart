import 'package:flutter/material.dart';
import '../Models/Order.dart';
import '../Services/api_service.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late Future<List<Order>> ordersFuture;

  @override
  void initState() {
    super.initState();
    ordersFuture = ApiService.fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders')),
      body: FutureBuilder<List<Order>>(
        future: ordersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final orders = snapshot.data!;
          if (orders.isEmpty) {
            return const Center(child: Text("No orders found."));
          }

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return ListTile(
                title: Text("Order #${order.id}"),
                subtitle: Text("Total: \$${order.total.toStringAsFixed(2)}\n"
                    "Status: ${order.status}\n"
                    "Date: ${order.createdAt.toLocal()}"),
              );
            },
          );
        },
      ),
    );
  }
}
