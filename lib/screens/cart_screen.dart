import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/book_provider.dart';
import '../models/cart_item.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

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

  String totalPrice(List<CartItem> cartItems) {
    double total = 0;
    for (CartItem item in cartItems) {
      total += item.totalPrice;
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<BookProvider>().cartItems;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leadingWidth: 70,
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: false,
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
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          constraints: const BoxConstraints(minHeight: 100, maxHeight: 130),
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
                    "\$${totalPrice(cartItems)}",
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  if (cartItems.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cart is empty!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutScreen(
                        totalAmount: double.parse(totalPrice(cartItems)),
                      ),
                    ),
                  );
                },
                color: const Color(0xffD4A056),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
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
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined,
                      size: 100, color: Colors.grey[400]),
                  const SizedBox(height: 20),
                  const Text("Your cart is empty",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text("Add some books to get started!",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.shopping_bag, color: Colors.white),
                    label: const Text('Browse Books',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffD4A056),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cartItems.length,
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
                            cartItems[index].book.imageUrl,
                            width: 80,
                            height: 140,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                width: 80,
                                height: 140,
                                child: const Icon(Icons.broken_image, size: 40),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              splitTitle(cartItems[index].book.title),
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.black),
                            ),
                            Text(
                              "\$${cartItems[index].totalPrice.toString()}",
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
                                      Provider.of<BookProvider>(context,
                                              listen: false)
                                          .decrementQuantity(cartItems[index]);
                                    },
                                    icon: const Icon(Icons.remove),
                                    iconSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${cartItems[index].quantity}",
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
                                      Provider.of<BookProvider>(context,
                                              listen: false)
                                          .incrementQuantity(cartItems[index]);
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
