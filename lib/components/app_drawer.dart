import 'package:flutter/material.dart';
import 'package:mini_projeto_flutter/screens/calculadora_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/sorteio_screen.dart';
import '../screens/sobre_screen.dart';
import '../screens/login_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Image.asset(
                  'assets/4.png', // nome exato do seu arquivo
                  height: 200,     // pode ajustar o tamanho conforme quiser
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Boas-vindas'),
              onTap: () => Navigator.pushReplacementNamed(context, WelcomeScreen.route),
            ),
            ListTile(
              leading: const Icon(Icons.casino),
              title: const Text('Sorteio'),
              onTap: () => Navigator.pushReplacementNamed(context, SorteioScreen.route),
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Calculadora'),
              onTap: () {
                Navigator.of(context).pushNamed(CalculatorScreen.route);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Sobre'),
              onTap: () => Navigator.pushReplacementNamed(context, SobreScreen.route),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair'),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.route,
                    (route) => false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
