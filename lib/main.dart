import 'package:flutter/material.dart';
import 'view/home_view.dart';
import 'view/result_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiki Taka',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
        '/resultado': (context) => const ResultView(),
      },
    );
  }
}
