import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/ui_provider.dart';
import 'ventas_page.dart';
import 'palindromo_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    
    final List<Widget> pages = [
      const VentasPage(),
      const PalindromoPage(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: uiProvider.selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: uiProvider.selectedIndex,
        onTap: (int i) => uiProvider.selectedIndex = i,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Ventas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Palíndromo',
          ),
        ],
      ),
    );
  }
}
