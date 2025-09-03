// Importa o que será usado (as telas)
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/sorteio_screen.dart';
import 'screens/sobre_screen.dart';
import 'screens/calculadora_screen.dart';


// Função principal que inicializa o app
void main() {
  runApp(const MiniAppFlutter()); // Executa o widget raiz
}

// Widget raiz do app (Stateless pois não muda de estado)
class MiniAppFlutter extends StatelessWidget {
  const MiniAppFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini App Flutter', // Nome do app
      debugShowCheckedModeBanner: false, // Remove o "DEBUG" no canto da tela
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange, // fundo laranja
          foregroundColor: Colors.white,  // texto e ícones em branco
        ),
      ),
      initialRoute: LoginScreen.route, // Tela inicial do app
      routes: {
        // Mapa de rotas (nomes de caminhos que apontam para as telas)
        LoginScreen.route: (_) => const LoginScreen(),
        WelcomeScreen.route: (_) => const WelcomeScreen(),
        SorteioScreen.route: (_) => const SorteioScreen(),
        SobreScreen.route: (_) => const SobreScreen(),
        CalculatorScreen.route: (_) => const CalculatorScreen(),
      },
    );
  }
}
