import 'package:flutter/material.dart';
import '../../controller/palindromo_controller.dart';

class PalindromoProvider extends ChangeNotifier {
  String _resultado = "";
  final PalindromoController _controller = PalindromoController();

  String get resultado => _resultado;

  void verificarPalindromo(String palabra) {
    bool es = _controller.esPalindromo(palabra);
    if (es) {
      _resultado = "Es palíndromo :D";
    } else {
      _resultado = "No es palíndromo :O";
    }
    notifyListeners();
  }

  void limpiar() {
    _resultado = "";
    notifyListeners();
  }
}
