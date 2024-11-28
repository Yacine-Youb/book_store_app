import 'package:flutter/material.dart';
import 'book_data.dart';

class BookProvider with ChangeNotifier {
  List<BookData> _books = [];
  List<BookData> _favouriteBooks = [];

  List<BookData> get books => _books;
  List<BookData> get favouriteBooks => _favouriteBooks;

  void addFavourite(BookData book) {
    if (!_favouriteBooks.contains(book)) {
      _favouriteBooks.add(book);
      notifyListeners();
    }
  }

  void removeFavourite(BookData book) {
    if (_favouriteBooks.contains(book)) {
      _favouriteBooks.remove(book);
      notifyListeners();
    }
  }

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
