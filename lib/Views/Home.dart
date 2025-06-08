import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/HomeController.dart';
import '../Pages/OrdersPage.dart'; // make sure you import this

class Home extends StatelessWidget {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFB63741)),
              child: Center(
                child: Text('Categories',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
            ),
            ListTile(
              title: const Text("All"),
              onTap: () {
                controller.clearCategory();
                Get.back();
              },
            ),
            Obx(() => Expanded(
              child: ListView(
                children: controller.categories
                    .map((category) => ListTile(
                  title: Text(category),
                  onTap: () {
                    controller.filterByCategory(category);
                    Get.back();
                  },
                ))
                    .toList(),
              ),
            )),
            const Divider(),
            ListTile(
              title: Text("My Orders"),
              onTap: () {
                Get.to(() => OrdersPage());
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: controller.logout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent.shade100,
                ),
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.filteredProducts.isEmpty) {
          return const Center(child: Text('No products available.'));
        }

        return ListView.builder(
          itemCount: controller.filteredProducts.length,
          itemBuilder: (context, index) {
            final product = controller.filteredProducts[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              elevation: 3,
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: product['image'] != null
                    ? Image.network(
                  product['image'],
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.image),
                )
                    : Icon(Icons.image),
                title: Text(product['name'] ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (product['description'] != null)
                      Text("Description: ${product['description']}"),
                    if (product['category'] != null)
                      Text("Category: ${product['category']}"),
                    if (product['weight'] != null)
                      Text("Weight: ${product['weight']}"),
                    if (product['price'] != null)
                      Text("Price: \$${product['price']}"),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
