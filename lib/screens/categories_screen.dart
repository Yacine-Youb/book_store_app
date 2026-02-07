import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/book_service.dart';
import '../components/best_selling_card.dart';
import '../screens/book_list_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = BookService.getAllCategories();
    final bestSellingBooks = BookService.getBestSellingBooks();
    final trendingSearches = [
      'Harry Potter',
      'Self-Help',
      'Fiction',
      'Habits',
      'Fantasy'
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Categories',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Browse Categories Section
              const Text(
                'Browse Categories',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 2;
                  if (constraints.maxWidth > 600) {
                    crossAxisCount = 3;
                  }
                  if (constraints.maxWidth > 900) {
                    crossAxisCount = 4;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final bookCount = BookService.getCategoryCount(category);
                      return _CategoryCard(
                        category: category,
                        bookCount: bookCount,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookListScreen(
                                title: category,
                                books: BookService.getBooksByCategory(category),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 30),

              // Trending Searches Section
              const Text(
                'Trending Searches',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: trendingSearches.map((search) {
                  return Chip(
                    label: Text(search),
                    backgroundColor: const Color(0xFFF5F5F5),
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: BorderSide.none,
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),

              // Best Selling Section
              Row(
                children: [
                  const Text(
                    'Best Selling',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookListScreen(
                            title: 'Best Selling Books',
                            books: bestSellingBooks,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffD4A056),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: bestSellingBooks.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BestSellingCard(bookData: bestSellingBooks[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String category;
  final int bookCount;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.category,
    required this.bookCount,
    required this.onTap,
  });

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'fiction':
        return CupertinoIcons.book;
      case 'self-help':
        return CupertinoIcons.lightbulb;
      case 'business':
        return CupertinoIcons.briefcase;
      case 'biography':
        return CupertinoIcons.person;
      default:
        return CupertinoIcons.bookmark;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'fiction':
        return const Color(0xFFE3F2FD);
      case 'self-help':
        return const Color(0xFFFFF3E0);
      case 'business':
        return const Color(0xFFE8F5E9);
      case 'biography':
        return const Color(0xFFFCE4EC);
      default:
        return const Color(0xFFF5F5F5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: _getCategoryColor(category),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getCategoryIcon(category),
                size: 28,
                color: const Color(0xffD4A056),
              ),
              const SizedBox(height: 6),
              Flexible(
                child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '$bookCount ${bookCount == 1 ? 'book' : 'books'}',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
