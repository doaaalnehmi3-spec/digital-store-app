import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/store_provider.dart';
import 'product_details_screen.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryName;
  const CategoryProductsScreen({Key? key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredList = Provider.of<StoreProvider>(context).getProductsByCategory(categoryName);

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: filteredList.isEmpty
          ? const Center(child: Text('No products found in this category.', style: TextStyle(color: Colors.black45)))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final product = filteredList[index];
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(product.imageUrl, width: 45, height: 45, fit: BoxFit.cover),
                    ),
                    title: Text(product.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    subtitle: Text('\$${product.price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.w600)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product)),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}