import '../models/book_data.dart';

class BookService {
  static List<BookData> getAllBooks() {
    return [
      const BookData(
        title: 'Atomic Habits',
        author: 'James Clear',
        description:
            'A comprehensive and practical guide to improving your life by forming good habits, breaking bad ones, and mastering the art of continuous improvement through tiny, consistent changes.',
        rating: 4.8,
        price: 19.99,
        imageUrl: 'assets/images/atomic habits.jpg',
        category: 'Self-Help',
      ),
      const BookData(
        title: 'City of Orange',
        author: 'David Yoon',
        description:
            'A gripping post-apocalyptic tale that follows the journey of a man struggling to survive in a world shrouded in darkness, navigating memories of his past and uncovering secrets about the disappearance of the sun.',
        rating: 4.5,
        price: 14.99,
        imageUrl: 'assets/images/city of orange.jpg',
        category: 'Fiction',
      ),
      const BookData(
        title: 'Harry Potter',
        author: 'J.K. Rowling',
        description:
            'Follow the magical journey of Harry Potter, a young wizard who discovers his extraordinary heritage while attending Hogwarts School of Witchcraft and Wizardry and fighting against the forces of darkness.',
        rating: 4.9,
        price: 24.99,
        imageUrl: 'assets/images/harry potter.jpg',
        category: 'Fiction',
      ),
      const BookData(
        title: 'Surrounded by Idiots',
        author: 'Thomas Erikson',
        description:
            'An insightful book that dives deep into human behavior, offering tools and techniques to identify personality types, improve communication skills, and enhance interpersonal relationships in every aspect of life.',
        rating: 4.6,
        price: 18.99,
        imageUrl: 'assets/images/idiots.jpg',
        category: 'Self-Help',
      ),
      const BookData(
        title: 'The 7 Habits of Highly Effective People',
        author: 'Stephen R. Covey',
        description:
            'A groundbreaking self-help book presenting powerful principles and strategies for achieving personal and professional success, promoting values like proactivity, synergy, and sharpening your skills.',
        rating: 4.7,
        price: 22.50,
        imageUrl: 'assets/images/the 7 habits.jpg',
        category: 'Self-Help',
      ),
      const BookData(
        title: 'The Land of Zicola',
        author: 'Lena McCay',
        description:
            'A thrilling fantasy adventure set in a mystical land, where a brave protagonist must overcome incredible challenges, embrace magic, and summon courage to rescue a hidden kingdom from looming threats.',
        rating: 4.4,
        price: 15.75,
        imageUrl: 'assets/images/zicola.jpg',
        category: 'Fiction',
      ),
    ];
  }

  static List<BookData> getRecommendedBooks() {
    return getAllBooks();
  }

  static List<BookData> getBestSellingBooks() {
    return getAllBooks();
  }

  static List<String> getAllCategories() {
    final books = getAllBooks();
    final categories = books.map((book) => book.category).toSet().toList();
    categories.sort();
    return categories;
  }

  static List<BookData> getBooksByCategory(String category) {
    return getAllBooks().where((book) => book.category == category).toList();
  }

  static int getCategoryCount(String category) {
    return getBooksByCategory(category).length;
  }
}
