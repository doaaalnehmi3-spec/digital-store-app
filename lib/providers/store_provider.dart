import 'package:flutter/material.dart';
import '../models/product.dart';

class StoreProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 'prod_001',
      title: '27-Inch Curved Gaming Monitor',
      description: 'Professional gaming monitor with a high refresh rate and ultra-wide crystal clear display, perfect for work, design, and gaming.',
      price: 299.99,
      imageUrl: 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=500',
      category: 'Electronics',
    ),
    Product(
      id: 'prod_002',
      title: 'Wireless Smart Headphones',
      description: 'Premium noise-canceling headphones with long-lasting battery life and immersive pure sound technology.',
      price: 129.50,
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500',
      category: 'Electronics',
    ),
    Product(
      id: 'prod_003',
      title: 'Business & Travel Backpack',
      description: 'Water-resistant backpack featuring a built-in USB charging port and dedicated compartments for laptops and documents.',
      price: 45.00,
      imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=500',
      category: 'Clothes',
    ),
    Product(
      id: 'prod_004',
      title: 'Lightweight Running Shoes',
      description: 'Ergonomically designed running shoes with a flexible orthotic sole providing maximum comfort for long-distance walks.',
      price: 75.00,
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500',
      category: 'Clothes',
    ),
    Product(
      id: 'prod_005',
      title: 'Modern Software Engineering Book',
      description: 'A comprehensive guide exploring best practices, system architectures, and stable system engineering in production.',
      price: 35.00,
      imageUrl: 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=500',
      category: 'Books',
    ),
  ];

  final List<Product> _cartItems = [];
  final List<Product> _favoriteItems = [];

  List<Product> get products => _products;
  List<Product> get cartItems => _cartItems;
  List<Product> get favoriteItems => _favoriteItems;
  
  List<String> get categories => ['Electronics', 'Clothes', 'Books'];

  List<Product> getProductsByCategory(String categoryName) {
    return _products.where((element) => element.category == categoryName).toList();
  }

  void addToCart(Product product) {
    if (!_cartItems.contains(product)) {
      _cartItems.add(product);
      notifyListeners();
    }
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  void toggleFavorite(Product product) {
    if (_favoriteItems.contains(product)) {
      _favoriteItems.remove(product);
    } else {
      _favoriteItems.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favoriteItems.contains(product);
  }
}