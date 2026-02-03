import '../model/resumen_ventas.dart';

class VentasController {

  ResumenVentas procesarVentas(List<Map<String, dynamic>> ventas) {
    final resumen = ResumenVentas();

    // Ciclo repetitivo
    for (var venta in ventas) {

      double valor = venta["valor"];

      // Condicionales
      if (valor > 1000) {
        resumen.mayores1000++;
        resumen.totalMayores1000 += valor;
      } else if (valor > 500 && valor <= 1000) {
        resumen.entre500y1000++;
        resumen.totalEntre500y1000 += valor;
      } else {
        resumen.menores500++;
        resumen.totalMenores500 += valor;
      }

      resumen.totalGlobal += valor;
      
      String categoria = venta["categoria"];
      if (resumen.totalesPorCategoria.containsKey(categoria)) {
        resumen.totalesPorCategoria[categoria] = resumen.totalesPorCategoria[categoria]! + valor;
      } else {
        resumen.totalesPorCategoria[categoria] = valor;
      }
    }

    return resumen;
  }
}
