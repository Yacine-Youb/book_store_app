import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/book_provider.dart';
import '../utils/book_data.dart';
import 'home_screem.dart'; // Assuming this is your home screen file

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String splitTitle(String title) {
    if (title.length <= 14) return title;

    String result = "";
    List<String> titles = title.split(' ');
    for (String item in titles) {
      if (result.length + item.length < 14) {
        result += " $item";
      }
    }
    return "$result...";
  }

  String totalPrice(List<BookData> books) {
    double total = 0;
    for (BookData book in books) {
      total += book.priceIncrement();
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final books = context.watch<BookProvider>().books;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leadingWidth: 70,
          surfaceTintColor: Colors.white,
          leading: Container(
            margin: const EdgeInsets.only(left: 20),
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF6F6F4),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeScreem()),
                  (route) => false,
                );
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xffD4A056),
                size: 20,
              ),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffF6F6F4),
              ),
              child: GestureDetector(
                onTap: () {
                  Provider.of<BookProvider>(context, listen: false).clearList();
                  setState(() {});
                },
                child: const Icon(
                  Icons.delete,
                  color: Color(0xffD4A056),
                  size: 30,
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Cart",
            style: TextStyle(color: Colors.black, fontSize: 34),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text("Total price:"),
                Text(
                  "\$${totalPrice(books)}",
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: () {},
              color: const Color(0xffD4A056),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              child: const Row(
                children: [
                  Text(
                    "Checkout",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: books.isEmpty
          ? const Center(
              child: Text(
                "No books in the cart!",
                style: TextStyle(fontSize: 24, color: Colors.black54),
              ),
            )
          : Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Material(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(14),
                          elevation: 10,
                          child: Image.asset(
                            books[index].imageUrl,
                            width: 80,
                            height: 140,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              splitTitle(books[index].title),
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.black),
                            ),
                            Text(
                              "\$${books[index].priceIncrement().toString()}",
                              style: const TextStyle(
                                  fontSize: 24,
                                  color: Color(0xffD4A056),
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 1),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      books[index].decrement();
                                      setState(() {});
                                    },
                                    icon: const Icon(Icons.remove),
                                    iconSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${books[index].quantite}",
                                  style: const TextStyle(fontSize: 24),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 1),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      books[index].increment();
                                      setState(() {});
                                    },
                                    icon: const Icon(Icons.add),
                                    iconSize: 20,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
