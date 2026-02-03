import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/ventas_provider.dart';
import 'result_page.dart';

class VentasPage extends StatefulWidget {
  const VentasPage({super.key});

  @override
  State<VentasPage> createState() => _VentasPageState();
}

class _VentasPageState extends State<VentasPage> {
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();

  void agregarVenta(BuildContext context) {
    if (_valorController.text.isNotEmpty &&
        _categoriaController.text.isNotEmpty) {
      
      final valor = double.tryParse(_valorController.text);
      if (valor != null) {
        Provider.of<VentasProvider>(context, listen: false)
            .agregarVenta(_categoriaController.text, valor);

        _categoriaController.clear();
        _valorController.clear();
      }
    }
  }

  void calcular(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ResultPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ventasProvider = Provider.of<VentasProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Ventas')),
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
              onPressed: () => agregarVenta(context),
              child: const Text('Agregar venta'),
            ),
            const SizedBox(height: 10),
            Text('Ventas registradas: ${ventasProvider.ventas.length}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => calcular(context),
              child: const Text('Procesar ventas'),
            ),
          ],
        ),
      ),
    );
  }
}
