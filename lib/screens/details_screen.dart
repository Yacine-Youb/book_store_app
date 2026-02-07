import 'package:book_shop/models/book_data.dart';
import 'package:book_shop/utils/book_provider.dart';
import 'package:book_shop/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLength;

  const ReadMoreText({super.key, required this.text, this.maxLength = 100});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final displayedText = isExpanded
        ? widget.text
        : widget.text.length > widget.maxLength
            ? '${widget.text.substring(0, widget.maxLength)}...'
            : widget.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayedText,
          style: const TextStyle(fontSize: 18),
        ),
        if (widget.text.length > widget.maxLength)
          GestureDetector(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Text(
              isExpanded ? 'Read Less' : 'Read More',
              style: const TextStyle(
                color: Color(0xffD4A056),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
      ],
    );
  }
}

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  final BookData bookData;

  const DetailsScreen({super.key, required this.bookData});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool addedToFavourite = false;

  @override
  void initState() {
    super.initState();
    // Check if book is already in favorites and set initial state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<BookProvider>(context, listen: false);
      setState(() {
        addedToFavourite = provider.favouriteBooks.contains(widget.bookData);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f6f6),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        leadingWidth: 80,
        leading: IconButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white)),
          icon: const Icon(HugeIcons.strokeRoundedArrowLeft01),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white)),
            icon: addedToFavourite
                ? const Icon(Icons.favorite, color: Color(0xffD4A056))
                : const Icon(Icons.favorite_border, color: Color(0xffD4A056)),
            onPressed: () {
              if (addedToFavourite) {
                Provider.of<BookProvider>(context, listen: false)
                    .removeFavourite(widget.bookData);
                addedToFavourite = false;
                setState(() {});
              } else {
                Provider.of<BookProvider>(context, listen: false)
                    .addFavourite(widget.bookData);
                addedToFavourite = true;
                setState(() {});
              }
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpeg"),
              fit: BoxFit.cover),
        ),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Material(
              elevation: 10,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.bookData.imageUrl),
                  width: 200,
                  height: 300,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.bookData.title,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        "\$${widget.bookData.price}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffD4A056),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xffFFD700)),
                      Text(
                        "${widget.bookData.rating}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Text(
                        "Book Description",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                    ],
                  ),
                  ReadMoreText(
                      text: widget.bookData.description, maxLength: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(16),
              ),
              child: IconButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                onPressed: () {
                  Provider.of<BookProvider>(context, listen: false)
                      .addToCart(widget.bookData);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${widget.bookData.title} added to cart'),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'VIEW CART',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartScreen()),
                          );
                        },
                      ),
                    ),
                  );
                },
                icon: const Icon(HugeIcons.strokeRoundedShoppingCart01),
                iconSize: 30,
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              style: ButtonStyle(
                padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 60, vertical: 20)),
                backgroundColor:
                    const WidgetStatePropertyAll(Color(0xffD4A056)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              onPressed: () {
                // Add to cart first
                Provider.of<BookProvider>(context, listen: false)
                    .addToCart(widget.bookData);

                // Navigate directly to cart
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
              child: const Row(
                children: [
                  Text(
                    "Buy Now",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    HugeIcons.strokeRoundedArrowRight01,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
