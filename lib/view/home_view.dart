import 'package:flutter/material.dart';
import '../controller/ventas_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();

  final List<Map<String, dynamic>> ventas = [];
  final VentasController controller = VentasController();

  void agregarVenta() {
    if (_valorController.text.isNotEmpty &&
        _categoriaController.text.isNotEmpty) {

      ventas.add({
        "categoria": _categoriaController.text,
        "valor": double.parse(_valorController.text)
      });

      _categoriaController.clear();
      _valorController.clear();
    }
  }

  void calcular() {
    final resumen = controller.procesarVentas(ventas);

    Navigator.pushNamed(
      context,
      '/resultado',
      arguments: resumen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tienda Tiki Taka')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: _categoriaController,
              decoration: const InputDecoration(
                labelText: 'Categoría',
              ),
            ),

            TextField(
              controller: _valorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor de la venta',
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: agregarVenta,
              child: const Text('Agregar venta'),
            ),

            const SizedBox(height: 10),
            Text('Ventas registradas: ${ventas.length}'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calcular,
              child: const Text('Procesar ventas'),
            ),
          ],
        ),
      ),
    );
  }
}
