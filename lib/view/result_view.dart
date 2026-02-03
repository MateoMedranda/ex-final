import 'package:flutter/material.dart';
import '../model/resumen_ventas.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {

    final resumen =
    ModalRoute.of(context)!.settings.arguments as ResumenVentas;

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
