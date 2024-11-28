import 'package:book_shop/screens/home_screem.dart';
import 'package:book_shop/utils/clipper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset("assets/images/splash cover.jpg"),
            Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: Clipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Read Everytime",
                        style: TextStyle(fontSize: 40, color: Colors.black),
                      ),
                      Text(
                        "Buy and read your favourite \n books with best prices",
                        style: TextStyle(fontSize: 24, color: Colors.grey[600]),
                      ),
                      MaterialButton(
                          color: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20), // Add rounded corners
                          ),
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreem()),
                                (route) => false);
                          },
                          child: const Text("Get Started",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white)))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
