import 'package:book_shop/components/best_selling_card.dart';
import 'package:book_shop/components/book_card.dart';
import 'package:book_shop/screens/search_screen.dart';
import 'package:book_shop/screens/book_list_screen.dart';
import 'package:book_shop/screens/notification_screen.dart';
import 'package:book_shop/models/book_data.dart';
import 'package:book_shop/services/book_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<BookData> bookList;

  @override
  void initState() {
    super.initState();
    bookList = BookService.getAllBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()),
                  );
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationScreen()),
                  );
                },
                icon: const Icon(CupertinoIcons.bell)),
            const SizedBox(width: 10),
            const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            const SizedBox(width: 10),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text("Recommended",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500)),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookListScreen(
                                title: 'Recommended Books',
                                books: bookList,
                              ),
                            ),
                          );
                        },
                        child: const Text("View All",
                            style: TextStyle(fontSize: 16)),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 320,
                    child: ListView.builder(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: bookList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 180,
                            child: BookCard(
                                bookData:
                                    bookList[bookList.length - 1 - index]),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text("Best Selling",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500)),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookListScreen(
                                title: 'Best Selling Books',
                                books: bookList,
                              ),
                            ),
                          );
                        },
                        child: const Text("View All",
                            style: TextStyle(fontSize: 16)),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: bookList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BestSellingCard(bookData: bookList[index]),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ));
  }
}
