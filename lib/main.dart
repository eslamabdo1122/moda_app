import 'package:flutter/material.dart';
import 'package:moda/pages/categories.dart';
import 'package:moda/pages/home.dart';
import 'package:moda/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const SplashPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        '/category': (context) =>  CategoriesPage(),
        // '/login': (context) => const LoginScreen(),
      },
    );
  }
}
