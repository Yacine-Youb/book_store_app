import 'package:book_shop/screens/details_screen.dart';
import 'package:book_shop/models/book_data.dart';
import 'package:book_shop/utils/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.bookData});
  final BookData bookData;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;
        final cardHeight = constraints.maxHeight;
        final imageWidth = cardWidth * 0.75;
        final imageHeight = cardHeight * 0.65;

        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsScreen(bookData: bookData)));
          },
          child: SizedBox(
            width: cardWidth,
            height: cardHeight,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffF6EEE3),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: cardHeight * 0.6),
                      Flexible(
                        child: Text(
                            bookData.title.length >= 15
                                ? "${bookData.title.substring(0, 14)}..."
                                : bookData.title,
                            style: TextStyle(
                                fontSize: cardWidth * 0.095,
                                fontWeight: FontWeight.w500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star,
                              color: const Color(0xFFE4C500),
                              size: cardWidth * 0.08),
                          Text(bookData.rating.toString(),
                              style: TextStyle(
                                  fontSize: cardWidth * 0.085,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Flexible(
                            child: Text("\$${bookData.price}",
                                style: TextStyle(
                                    fontSize: cardWidth * 0.11,
                                    color: const Color(0xffD4A056),
                                    fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Provider.of<BookProvider>(context, listen: false)
                                  .addBook(bookData);
                            },
                            icon: const Icon(Icons.add),
                            color: Colors.white,
                            iconSize: cardWidth * 0.1,
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
                    top: -(cardHeight * 0.15),
                    left: cardWidth * 0.125,
                    child: SizedBox(
                      width: imageWidth,
                      height: imageHeight,
                      child: Material(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(20),
                          elevation: 10,
                          child: Image.asset(bookData.imageUrl,
                              width: imageWidth,
                              height: imageHeight,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Icon(Icons.broken_image, size: 50),
                            );
                          })),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
