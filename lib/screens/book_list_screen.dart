import 'package:flutter/material.dart';
import '../models/book_data.dart';
import '../components/book_card.dart';

class BookListScreen extends StatelessWidget {
  final String title;
  final List<BookData> books;

  const BookListScreen({
    super.key,
    required this.title,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: books.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book_outlined,
                        size: 100, color: Colors.grey[300]),
                    const SizedBox(height: 20),
                    const Text(
                      'No books available',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            : LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 2;
                  double childAspectRatio = 0.55;

                  if (constraints.maxWidth > 600) {
                    crossAxisCount = 3;
                    childAspectRatio = 0.58;
                  }
                  if (constraints.maxWidth > 900) {
                    crossAxisCount = 4;
                    childAspectRatio = 0.6;
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: childAspectRatio,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 70,
                    ),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return BookCard(bookData: books[index]);
                    },
                  );
                },
              ),
      ),
    );
  }
}
