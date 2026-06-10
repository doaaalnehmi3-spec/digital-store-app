import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/store_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: storeProvider.cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty', style: TextStyle(color: Colors.black45)))
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: storeProvider.cartItems.length,
              itemBuilder: (context, index) {
                final product = storeProvider.cartItems[index];
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(product.imageUrl, width: 45, height: 45, fit: BoxFit.cover),
                    ),
                    title: Text(product.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    subtitle: Text('\$${product.price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.indigo)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.black45),
                      onPressed: () => storeProvider.removeFromCart(product),
                    ),
                  ),
                );
              },
            ),
    );
  }
}