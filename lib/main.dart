import 'package:book_shop/screens/splash_screen.dart';
import 'package:book_shop/utils/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create the provider and load persisted data
  final bookProvider = BookProvider();
  await bookProvider.loadPersistedData();

  runApp(
    ChangeNotifierProvider.value(
      value: bookProvider,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
