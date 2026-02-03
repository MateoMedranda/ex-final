import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/ventas_provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos el resumen directamente calculado desde el Provider
    final resumen = Provider.of<VentasProvider>(context, listen: false).calcularResumen();

    return Scaffold(
      appBar: AppBar(title: const Text('Resumen de Ventas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ventas > \$1000: ${resumen.mayores1000}'),
            Text('Monto: \$${resumen.totalMayores1000}'),
            const SizedBox(height: 10),
            Text('Ventas entre \$500 y \$1000: ${resumen.entre500y1000}'),
            Text('Monto: \$${resumen.totalEntre500y1000}'),
            const SizedBox(height: 10),
            Text('Ventas ≤ \$500: ${resumen.menores500}'),
            Text('Monto: \$${resumen.totalMenores500}'),
            const Divider(height: 30),
            Text(
              'TOTAL GLOBAL: \$${resumen.totalGlobal}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
