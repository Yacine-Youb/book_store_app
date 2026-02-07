import 'book_data.dart';

class CartItem {
  final BookData book;
  int quantity;

  CartItem({required this.book, this.quantity = 1});

  void increment() {
    quantity++;
  }

  void decrement() {
    if (quantity > 1) {
      quantity--;
    }
  }

  double get totalPrice {
    double result = book.price * quantity;
    return double.parse(result.toStringAsFixed(2));
  }

  // Override equality and hashCode based on book
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItem && other.book == book;
  }

  @override
  int get hashCode => book.hashCode;
}
