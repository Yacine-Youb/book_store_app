import 'package:book_shop/utils/book_data.dart';
import 'package:book_shop/utils/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BestSellingCard extends StatelessWidget {
  BestSellingCard({super.key, required this.bookData});
  final BookData bookData;
  BookProvider _bookProvider = BookProvider();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 250,
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xffF6EEE3),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                      bookData.title.length >= 15
                          ? "${bookData.title.substring(0, 14)}..."
                          : bookData.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                  Row(
                    children: [
                      const Icon(Icons.star,
                          size: 14, color: Color(0xFFE4C500)),
                      Text(bookData.rating.toString(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("\$${bookData.price}",
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xffD4A056),
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        width: 40,
                      ),
                      IconButton(
                        onPressed: () {
                          if (!_bookProvider.books.contains(bookData)) {
                            Provider.of<BookProvider>(context, listen: false).addBook(bookData);
                          }
                        },
                        icon: const Icon(Icons.add),
                        color: Colors.white,
                        iconSize: 16,
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xffD4A056))),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
            top: -30,
            left: 20,
            child: SizedBox(
              width: 75,
              height: 115,
              child: Material(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(5),
                  elevation: 5,
                  child: Image.asset(bookData.imageUrl,
                      width: 75, height: 100, fit: BoxFit.fill)),
            )),
      ],
    );
  }
}
