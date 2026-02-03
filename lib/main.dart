import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/provider/ui_provider.dart';
import 'view/provider/ventas_provider.dart';
import 'view/provider/palindromo_provider.dart';
import 'view/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => VentasProvider()),
        ChangeNotifierProvider(create: (_) => PalindromoProvider()),
      ],
      child: MaterialApp(
        title: 'Examen Final',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
