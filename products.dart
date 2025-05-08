import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/orders.dart';
import 'package:http/http.dart' as http;

class Cart {
  static List<Map<String, dynamic>> items = [];

  static double get totalPrice =>
      items.fold(0, (sum, item) => sum + double.parse(item['price'].toString()));

  static void clear() => items.clear();
}

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final url = Uri.parse("http://localhost/fashiondata/get_data.php");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData['status'] == 'success') {
          setState(() {
            products = jsonData['data'];
          });
        } else {
          throw Exception('Failed to load products: ${jsonData['message']}');
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void addToBag(Map<String, dynamic> product) {
    setState(() {
      Cart.items.add({
        ...product,
        'price': double.tryParse(product['price'].toString()) ?? 0.0,
      });
    });

    // Navigate directly to Orders screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Orders()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB8926A),
        title: const Text("Products"),
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: fetchProducts,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.network(
                            product["image_url"],
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const Icon(Icons.image),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text(
                              product['description'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('KSh ${product['price']}'),
                                IconButton(
                                  icon: const Icon(Icons.add_shopping_cart, size: 20),
                                  onPressed: () => addToBag(product),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
