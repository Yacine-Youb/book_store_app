import 'package:flutter/material.dart';
import '../models/book_data.dart';
import '../models/cart_item.dart';
import '../services/storage_service.dart';

class BookProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];
  final List<BookData> _favouriteBooks = [];
  bool _isLoaded = false;

  List<CartItem> get cartItems => _cartItems;
  List<BookData> get favouriteBooks => _favouriteBooks;
  bool get isLoaded => _isLoaded;

  // For backwards compatibility - returns books from cart items
  List<BookData> get books => _cartItems.map((item) => item.book).toList();

  // Load persisted data from storage
  Future<void> loadPersistedData() async {
    if (_isLoaded) return; // Prevent multiple loads

    _cartItems.clear();
    _favouriteBooks.clear();

    final cart = await StorageService.loadCart();
    final favorites = await StorageService.loadFavorites();

    _cartItems.addAll(cart);
    _favouriteBooks.addAll(favorites);

    _isLoaded = true;
    notifyListeners();
  }

  void addFavourite(BookData book) {
    if (!_favouriteBooks.contains(book)) {
      _favouriteBooks.add(book);
      notifyListeners();
      StorageService.saveFavorites(_favouriteBooks);
    }
  }

  void removeFavourite(BookData book) {
    if (_favouriteBooks.contains(book)) {
      _favouriteBooks.remove(book);
      notifyListeners();
      StorageService.saveFavorites(_favouriteBooks);
    }
  }

  void addToCart(BookData book) {
    final existingIndex = _cartItems.indexWhere((item) => item.book == book);

    if (existingIndex != -1) {
      _cartItems[existingIndex].increment();
    } else {
      _cartItems.add(CartItem(book: book));
    }
    notifyListeners();
    StorageService.saveCart(_cartItems);
  }

  // Keep old method name for backwards compatibility during transition
  void addBook(BookData book) {
    addToCart(book);
  }

  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
    StorageService.saveCart(_cartItems);
  }

  void incrementQuantity(CartItem item) {
    item.increment();
    notifyListeners();
    StorageService.saveCart(_cartItems);
  }

  void decrementQuantity(CartItem item) {
    item.decrement();
    notifyListeners();
    StorageService.saveCart(_cartItems);
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
    StorageService.saveCart(_cartItems);
  }

  // Keep old method name for backwards compatibility
  void clearList() {
    clearCart();
  }
}
