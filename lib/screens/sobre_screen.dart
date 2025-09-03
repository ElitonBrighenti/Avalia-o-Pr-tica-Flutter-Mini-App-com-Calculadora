import 'package:flutter/material.dart';
import '../components/app_drawer.dart';

class SobreScreen extends StatelessWidget {
  static const route = '/sobre';
  const SobreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre o Sistema')),
      drawer: const AppDrawer(),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/4.png',
                  height: 200,
                  fit: BoxFit.contain,
                ),                const SizedBox(height: 20),
                const Text(
                  'App desenvolvido em Avaliação Prática Flutter – Mini App com Calculadora',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text('Desenvolvedor: -Eliton Brighenti',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
