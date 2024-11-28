import 'package:book_shop/screens/splash_screen.dart';
import 'package:book_shop/utils/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BookProvider(),
      child: MainApp(),
    ),
  );
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}
