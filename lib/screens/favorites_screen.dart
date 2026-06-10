import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/store_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: storeProvider.favoriteItems.isEmpty
          ? const Center(child: Text('No items added to favorites yet.', style: TextStyle(color: Colors.black45)))
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: storeProvider.favoriteItems.length,
              itemBuilder: (context, index) {
                final product = storeProvider.favoriteItems[index];
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
                      icon: const Icon(Icons.favorite, color: Colors.redAccent),
                      onPressed: () => storeProvider.toggleFavorite(product),
                    ),
                  ),
                );
              },
            ),
    );
  }
}