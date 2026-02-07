import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:book_shop/screens/home_screen.dart';
import 'package:book_shop/screens/favourit_screen.dart';
import 'package:book_shop/screens/cart_screen.dart';
import 'package:book_shop/screens/categories_screen.dart';
import 'package:book_shop/screens/profile_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    FavouritScreen(),
    CartScreen(),
    CategoriesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 20),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xffD4A056),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: IconButton(
          onPressed: () {
            setState(() {
              _currentIndex = 2;
            });
          },
          icon: const Icon(
            CupertinoIcons.bag,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                icon: Icon(
                  _currentIndex == 0
                      ? CupertinoIcons.house_fill
                      : CupertinoIcons.house,
                  color: _currentIndex == 0
                      ? const Color(0xffD4A056)
                      : Colors.black,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                icon: Icon(
                  _currentIndex == 1
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  color: _currentIndex == 1
                      ? const Color(0xffD4A056)
                      : Colors.black,
                  size: 30,
                ),
              ),
              const SizedBox(width: 65),
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 3;
                  });
                },
                icon: Icon(
                  _currentIndex == 3
                      ? CupertinoIcons.square_grid_2x2_fill
                      : CupertinoIcons.square_grid_2x2,
                  color: _currentIndex == 3
                      ? const Color(0xffD4A056)
                      : Colors.black,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 4;
                  });
                },
                icon: Icon(
                  _currentIndex == 4
                      ? CupertinoIcons.person_fill
                      : CupertinoIcons.person,
                  color: _currentIndex == 4
                      ? const Color(0xffD4A056)
                      : Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
