import 'package:flutter/material.dart';
import '../components/app_drawer.dart';

class WelcomeScreen extends StatelessWidget {
  static const route = '/welcome'; // Nome usado nas rotas
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Boas-vindas')),
      drawer: const AppDrawer(), // Menu lateral reutilizável
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/4.png',
              height: 200,
              fit: BoxFit.contain,
              ),
            const SizedBox(height: 16),
            const Text(
              'Bem-vindo ao pequeno projeto FORGE DIGITAL!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
