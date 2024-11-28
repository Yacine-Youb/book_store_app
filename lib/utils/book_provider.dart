import 'package:flutter/material.dart';
import 'book_data.dart';

class BookProvider with ChangeNotifier {
  List<BookData> _books = [];

  List<BookData> get books => _books;

  void addBook(BookData book) {
    if (!_books.contains(book)) {
      _books.add(book);
      notifyListeners();
    }
  }

  
  void clearList() {
    _books.clear();
    notifyListeners();
  }
}
