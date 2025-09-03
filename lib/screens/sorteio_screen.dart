import 'dart:math';
import 'package:flutter/material.dart';
import '../components/app_drawer.dart';

class SorteioScreen extends StatefulWidget {
  static const route = '/sorteio';
  const SorteioScreen({super.key});

  @override
  State<SorteioScreen> createState() => _SorteioScreenState();
}

class _SorteioScreenState extends State<SorteioScreen> {
  int? _numero;

  void _sortear() {
    final n = Random().nextInt(100) + 1;
    setState(() => _numero = n);

    if (n == 50) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Você ganhou!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sorteio')),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _numero == null ? 'Nenhum número sorteado' : 'Número: $_numero',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.casino),
              label: const Text('Sortear número'),
              onPressed: _sortear,
            ),
          ],
        ),
      ),
    );
  }
}
