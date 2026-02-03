import 'package:flutter/material.dart';
import '../../controller/ventas_controller.dart';
import '../../model/resumen_ventas.dart';

class VentasProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _ventas = [];
  final VentasController _controller = VentasController();

  List<Map<String, dynamic>> get ventas => _ventas;

  void agregarVenta(String categoria, double valor) {
    _ventas.add({
      "categoria": categoria,
      "valor": valor
    });
    notifyListeners();
  }

  ResumenVentas calcularResumen() {
    return _controller.procesarVentas(_ventas);
  }
  
  void limpiarVentas() {
    _ventas.clear();
    notifyListeners();
  }
}
