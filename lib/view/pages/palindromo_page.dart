import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/palindromo_provider.dart';

class PalindromoPage extends StatefulWidget {
  const PalindromoPage({super.key});

  @override
  State<PalindromoPage> createState() => _PalindromoPageState();
}

class _PalindromoPageState extends State<PalindromoPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final palindromoProvider = Provider.of<PalindromoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Verificador de Palíndromos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Ingrese una palabra o frase',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                palindromoProvider.verificarPalindromo(_textController.text);
              },
              child: const Text('Verificar'),
            ),
            const SizedBox(height: 20),
            if (palindromoProvider.resultado.isNotEmpty)
              Text(
                palindromoProvider.resultado,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
