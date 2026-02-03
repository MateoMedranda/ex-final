import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ex_final/view/pages/ventas_page.dart';
import 'package:ex_final/view/provider/ventas_provider.dart';

void main() {
  
  // Helper para inyectar el provider
  Widget createWidgetUnderTest() {
    return ChangeNotifierProvider(
      create: (_) => VentasProvider(),
      child: const MaterialApp(
        home: VentasPage(),
      ),
    );
  }

  // Prueba 1
  testWidgets('W1 - Render de pantalla Ventas', (tester) async {
    print('\nW1 Render de pantalla Ventas');

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Registro de Ventas'), findsOneWidget);
    print('Pantalla renderizada con titulo correcto');
  });

  // Prueba 2
  testWidgets('W2 - Campos y Botones Visibles', (tester) async {
    print('\nW2 Campos y Botones Visibles');

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(TextField), findsNWidgets(2)); // Categoria y Valor
    expect(find.text('Categoría'), findsOneWidget);
    expect(find.text('Valor de la venta'), findsOneWidget);
    expect(find.text('Agregar venta'), findsOneWidget);
    expect(find.text('Procesar ventas'), findsOneWidget);

    print('Campos y botones visibles');
  });

  // Prueba 3
  testWidgets('W3 - Agregar venta desde la UI', (tester) async {
    print('\nW3 Agregar venta desde la UI');

    await tester.pumpWidget(createWidgetUnderTest());

    // Ingresar datos
    await tester.enterText(find.byType(TextField).at(0), 'Ropa');
    await tester.enterText(find.byType(TextField).at(1), '1500');
    
    // Tap boton agregar
    await tester.tap(find.text('Agregar venta'));
    await tester.pump(); // Rebuild del widget

    // Verificar que se actualizo el contador de ventas
    expect(find.text('Ventas registradas: 1'), findsOneWidget);

    print('Venta agregada y contador actualizado');
  });
}