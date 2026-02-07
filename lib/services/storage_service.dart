import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/book_data.dart';
import '../models/cart_item.dart';

class StorageService {
  static const String _cartKey = 'cart_items';
  static const String _favoritesKey = 'favorites';

  // Save cart items to local storage
  static Future<void> saveCart(List<CartItem> items) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartData = items
          .map((item) => {
                'book': {
                  'title': item.book.title,
                  'author': item.book.author,
                  'description': item.book.description,
                  'rating': item.book.rating,
                  'price': item.book.price,
                  'imageUrl': item.book.imageUrl,
                },
                'quantity': item.quantity,
              })
          .toList();
      await prefs.setString(_cartKey, json.encode(cartData));
    } catch (e) {
      print('Error saving cart: $e');
    }
  }

  // Load cart items from local storage
  static Future<List<CartItem>> loadCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? cartJson = prefs.getString(_cartKey);
      if (cartJson == null) return [];

      final List<dynamic> cartData = json.decode(cartJson);
      return cartData.map((item) {
        final bookMap = item['book'];
        return CartItem(
          book: BookData(
            title: bookMap['title'],
            author: bookMap['author'],
            description: bookMap['description'],
            rating: bookMap['rating'],
            price: bookMap['price'],
            imageUrl: bookMap['imageUrl'],
          ),
          quantity: item['quantity'],
        );
      }).toList();
    } catch (e) {
      print('Error loading cart: $e');
      return [];
    }
  }

  // Save favorite books to local storage
  static Future<void> saveFavorites(List<BookData> books) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favData = books
          .map((book) => {
                'title': book.title,
                'author': book.author,
                'description': book.description,
                'rating': book.rating,
                'price': book.price,
                'imageUrl': book.imageUrl,
              })
          .toList();
      await prefs.setString(_favoritesKey, json.encode(favData));
    } catch (e) {
      print('Error saving favorites: $e');
    }
  }

  // Load favorite books from local storage
  static Future<List<BookData>> loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? favJson = prefs.getString(_favoritesKey);
      if (favJson == null) return [];

      final List<dynamic> favData = json.decode(favJson);
      return favData
          .map((item) => BookData(
                title: item['title'],
                author: item['author'],
                description: item['description'],
                rating: item['rating'],
                price: item['price'],
                imageUrl: item['imageUrl'],
              ))
          .toList();
    } catch (e) {
      print('Error loading favorites: $e');
      return [];
    }
  }

  // Clear all saved data (useful for logout or reset)
  static Future<void> clearAll() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_cartKey);
      await prefs.remove(_favoritesKey);
    } catch (e) {
      print('Error clearing storage: $e');
    }
  }
}
