import 'package:book_shop/components/best_selling_card.dart';
import 'package:book_shop/components/book_card.dart';
import 'package:book_shop/screens/cart_screen.dart';
import 'package:book_shop/utils/book_data.dart';
import 'package:flutter/material.dart';

class HomeScreem extends StatefulWidget {
  const HomeScreem({super.key});
  @override
  State<HomeScreem> createState() => _HomeScreemState();
}

class _HomeScreemState extends State<HomeScreem> {
  int _selectedIndex = 0;
  List<BookData> bookList = [
    BookData(
      title: 'Atomic Habits',
      author: 'James Clear',
      description:
          'A comprehensive and practical guide to improving your life by forming good habits, breaking bad ones, and mastering the art of continuous improvement through tiny, consistent changes.',
      rating: 4.8,
      price: 19.99,
      imageUrl: 'assets/images/atomic habits.jpg',
    ),
    BookData(
      title: 'City of Orange',
      author: 'David Yoon',
      description:
          'A gripping post-apocalyptic tale that follows the journey of a man struggling to survive in a world shrouded in darkness, navigating memories of his past and uncovering secrets about the disappearance of the sun.',
      rating: 4.5,
      price: 14.99,
      imageUrl: 'assets/images/city of orange.jpg',
    ),
    BookData(
      title: 'Harry Potter',
      author: 'J.K. Rowling',
      description:
          'Follow the magical journey of Harry Potter, a young wizard who discovers his extraordinary heritage while attending Hogwarts School of Witchcraft and Wizardry and fighting against the forces of darkness.',
      rating: 4.9,
      price: 24.99,
      imageUrl: 'assets/images/harry potter.jpg',
    ),
    BookData(
      title: 'Surrounded by Idiots',
      author: 'Thomas Erikson',
      description:
          'An insightful book that dives deep into human behavior, offering tools and techniques to identify personality types, improve communication skills, and enhance interpersonal relationships in every aspect of life.',
      rating: 4.6,
      price: 18.99,
      imageUrl: 'assets/images/idiots.jpg',
    ),
    BookData(
      title: 'The 7 Habits of Highly Effective People',
      author: 'Stephen R. Covey',
      description:
          'A groundbreaking self-help book presenting powerful principles and strategies for achieving personal and professional success, promoting values like proactivity, synergy, and sharpening your skills.',
      rating: 4.7,
      price: 22.50,
      imageUrl: 'assets/images/the 7 habits.jpg',
    ),
    BookData(
      title: 'The Land of Zicola',
      author: 'Lena McCay',
      description:
          'A thrilling fantasy adventure set in a mystical land, where a brave protagonist must overcome incredible challenges, embrace magic, and summon courage to rescue a hidden kingdom from looming threats.',
      rating: 4.4,
      price: 15.75,
      imageUrl: 'assets/images/zicola.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          title: IconButton(
              onPressed: () {},
              icon: const ImageIcon(AssetImage('assets/images/paragraph.png'))),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            const SizedBox(width: 10),
            const CircleAvatar(
              radius: 20, // Half the diameter
              backgroundImage: AssetImage(
                  'assets/images/profile.jpg'), // Replace with your image URL
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const Text("Recommended",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child:
                        const Text("View All", style: TextStyle(fontSize: 16)),
                  )
                ],
              ),
              const SizedBox(height: 50),
              // Wrap ListView.builder with Expanded to avoid layout overflow
              SizedBox(
                height: 320, // Set a height
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: bookList.length,
                  itemBuilder: (context, index) {
                    if (bookList.isEmpty) {
                      return const SizedBox(); // Handle null case gracefully
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BookCard(
                          bookData: bookList[bookList.length - 1 - index]),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  const Text("Best Selling",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child:
                        const Text("View All", style: TextStyle(fontSize: 16)),
                  )
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 120, // Set a height
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
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            showSelectedLabels: false,
            iconSize: 30,
            items: [
              const BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Color(0xffD4A056),
                  ),
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.home_outlined, color: Colors.black),
                  label: "Home"),
              const BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Color(0xffD4A056),
                  ),
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
                  label: "favorite"),
              BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CartScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffD4A056),
                      ),
                      child: const Icon(Icons.shopping_cart_outlined,
                          color: Colors.white),
                    ),
                  ),
                  label: "Cart"),
              const BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.notifications_active,
                    color: Color(0xffD4A056),
                  ),
                  icon: Icon(Icons.notifications_active_outlined,
                      color: Colors.black),
                  label: "Notification"),
              const BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.person,
                  color: Color(0xffD4A056),
                ),
                icon: Icon(Icons.person_outline, color: Colors.black),
                label: "Profile",
              )
            ]));
  }
}
