import 'package:book_shop/screens/details_screen.dart';
import 'package:book_shop/utils/book_data.dart';
import 'package:book_shop/utils/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.bookData});
  final BookData bookData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsScreen(bookData: bookData)));
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 200,
            height: 300,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xffF6EEE3),
            ),
            child: Column(
              children: [
                const SizedBox(height: 190),
                Text(
                    bookData.title.length >= 15
                        ? "${bookData.title.substring(0, 14)}..."
                        : bookData.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500)),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xFFE4C500)),
                    Text(bookData.rating.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ],
                ),
                Row(
                  children: [
                    Text("\$${bookData.price}",
                        style: const TextStyle(
                            fontSize: 24,
                            color: Color(0xffD4A056),
                            fontWeight: FontWeight.w500)),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Provider.of<BookProvider>(context, listen: false)
                            .addBook(bookData);
                      },
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                      iconSize: 20,
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Color(0xffD4A056))),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
              top: -50,
              left: 25,
              child: SizedBox(
                width: 150,
                height: 230,
                child: Material(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(20),
                    elevation: 10,
                    child: Image.asset(bookData.imageUrl,
                        width: 150, height: 200, fit: BoxFit.fill)),
              )),
        ],
      ),
    );
  }
}
