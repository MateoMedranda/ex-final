class PalindromoController {
  bool esPalindromo(String palabra) {
    if (palabra.isEmpty) return false;
    String limpio = palabra.replaceAll(' ', '').toLowerCase();
    String invertido = limpio.split('').reversed.join('');
    return limpio == invertido;
  }
}
