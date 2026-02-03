import 'package:flutter_test/flutter_test.dart';
import 'package:ex_final/controller/ventas_controller.dart';
import 'package:ex_final/model/resumen_ventas.dart';

// metodo principal

void main(){
  // instanciamos la clase VentasController
  final controller = VentasController();

  print('=======================');
  print('Pruebas Unitarias - Ventas');
  print('=======================');

  // Grupo de Pruebas
  // Grupo 1 - Pruebas Correctas

  group('Grupo 1 - Pruebas Correctas', () {
    //Prueba 1
    test('Prueba 1 - Clasificacion por montos',() {
      print('\nPrueba 1: Clasificacion por montos');
      // Arrange
      final ventas = [
        {"categoria": "A", "valor": 1200.0}, // Mayor a 1000
        {"categoria": "B", "valor": 800.0},  // Entre 500 y 1000
        {"categoria": "C", "valor": 100.0}   // Menor o igual a 500
      ];
      print('Datos de entrada --> Lista con ventas de 1200, 800 y 100');

      // Act
      final resumen = controller.procesarVentas(ventas);
      print('Resultado obtenido ---> mayores1000: ${resumen.mayores1000}, entre500y1000: ${resumen.entre500y1000}, menores500: ${resumen.menores500}');

      // Assert
      expect(resumen.mayores1000, 1, reason: 'Debe haber 1 venta mayor a 1000');
      expect(resumen.entre500y1000, 1, reason: 'Debe haber 1 venta entre 500 y 1000');
      expect(resumen.menores500, 1, reason: 'Debe haber 1 venta menor a 500');
      
      print('Prueba 1 pasada');
    });

    //Prueba 2
    test('Prueba 2 - Calculo de Totales',(){
      print('\nPrueba 2: Calculo de Totales');
      // Arrange
      final ventas = [
        {"categoria": "A", "valor": 1200.0},
        {"categoria": "B", "valor": 800.0}, 
        {"categoria": "C", "valor": 100.0}
      ];
      print('Datos de entrada --> Lista con valores 1200, 800, 100');

      // Act
      final resumen = controller.procesarVentas(ventas);
      print('Resultado obtenido ---> Total Global: ${resumen.totalGlobal}');

      // Assert
      expect(
          resumen.totalGlobal,
          closeTo(2100.0, 0.001),
          reason: 'El total debe ser 2100'
      );
      print('Prueba 2 pasada');
    });

    // Prueba 3
    test('Prueba 3 - Total por Categoria', (){
      print('Prueba 3: Total por Categoria');

      // Arrange
      final ventas = [
        {"categoria": "Ropa", "valor": 100.0},
        {"categoria": "Ropa", "valor": 200.0},
        {"categoria": "Comida", "valor": 50.0}
      ];
      print('Ventas: Ropa(100), Ropa(200), Comida(50)');

      // Act
      final resumen = controller.procesarVentas(ventas);
      print('Resultado obtenido ---> Ropa: ${resumen.totalesPorCategoria['Ropa']}, Comida: ${resumen.totalesPorCategoria['Comida']}');

      // Assert
      expect(
          resumen.totalesPorCategoria['Ropa'],
          closeTo(300.0, 0.001),
          reason: 'Total Ropa debe ser 300'
      );
      expect(
          resumen.totalesPorCategoria['Comida'],
          closeTo(50.0, 0.001),
          reason: 'Total Comida debe ser 50'
      );
      print('Prueba 3 pasada');

    });
  });

  group('Grupo 2 - Pruebas Incorrectas', (){
    // Prueba 4
    test('Prueba 4 - Lista vacia', (){
      print('Prueba 4: Lista vacia');

      // Arrange
      final List<Map<String, dynamic>> ventas = [];
      print('Lista vacia');

      // Act
      final resumen = controller.procesarVentas(ventas);
      print('Resultado obtenido ---> totalGlobal = ${resumen.totalGlobal}');

      // Assert
      expect(
          resumen.totalGlobal,
          closeTo(0, 0.001),
          reason: 'El total debe ser 0'
      );
      print('Prueba 4 pasada');
    });
  });
}
