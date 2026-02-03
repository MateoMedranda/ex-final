import 'package:flutter_test/flutter_test.dart';
import 'package:ex_final/controller/palindromo_controller.dart';

// metodo principal

void main(){
  // instanciamos la clase PalindromoController
  final controller = PalindromoController();

  print('=======================');
  print('Pruebas Unitarias - Palindromo');
  print('=======================');

  // Grupo de Pruebas
  // Grupo 1 - Pruebas Correctas

  group('Grupo 1 - Pruebas Correctas', () {
    //Prueba 1
    test('Prueba 1 - Palabra palindroma simple',() {
      print('\nPrueba 1: Palabra palindroma simple');
      // Arrange
      const palabra = "ana";
      print('Datos de entrada --> "$palabra"');

      // Act
      final resultado = controller.esPalindromo(palabra);
      print('Resultado obtenido ---> $resultado');

      // Assert
      expect(resultado, true, reason: 'Debe ser verdadero');
      print('Prueba 1 pasada');
    });

    //Prueba 2
    test('Prueba 2 - Frase palindroma',(){
      print('\nPrueba 2: Frase palindroma');
      // Arrange
      const palabra = "anita lava la tina";
      print('Datos de entrada --> "$palabra"');

      // Act
      final resultado = controller.esPalindromo(palabra);
      print('Resultado obtenido ---> $resultado');

      // Assert
      expect(resultado, true, reason: 'Debe ser verdadero aunque tenga espacios');
      print('Prueba 2 pasada');
    });

    // Prueba 3
    test('Prueba 3 - No es palindromo', (){
      print('Prueba 3: No es palindromo');

      // Arrange
      const palabra = "hola mundo";
      print('Datos de entrada --> "$palabra"');

      // Act
      final resultado = controller.esPalindromo(palabra);
      print('Resultado obtenido ---> $resultado');

      // Assert
      expect(resultado, false, reason: 'Debe ser falso');
      print('Prueba 3 pasada');

    });
  });

  group('Grupo 2 - Pruebas Incorrectas', (){
    // Prueba 4
    test('Prueba 4 - Cadena vacia', (){
      print('Prueba 4: Cadena vacia');

      // Arrange
      const palabra = "";
      print('Datos de entrada --> Cadena vacia');

      // Act
      final resultado = controller.esPalindromo(palabra);
      print('Resultado obtenido ---> $resultado');

      // Assert
      expect(resultado, false, reason: 'Debe retornar falso para cadena vacia');
      print('Prueba 4 pasada');
    });
  });
}
