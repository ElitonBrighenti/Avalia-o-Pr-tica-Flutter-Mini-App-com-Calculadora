import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login'; // Nome da rota para navegação
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// Parte que gerencia o estado da tela
class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Controla o formulário
  final _emailCtrl = TextEditingController(); // Controla o campo de e-mail
  final _senhaCtrl = TextEditingController(); // Controla o campo de senha
  bool _obscure = true; // Controla se a senha está oculta

  @override
  void dispose() {
    _emailCtrl.dispose(); // Libera memória
    _senhaCtrl.dispose();
    super.dispose();
  }

  // Lógica do botão Entrar
  void _login() {
    if (_formKey.currentState!.validate()) {
      final email = _emailCtrl.text.trim(); // Pega valor digitado
      final senha = _senhaCtrl.text;

      if (email == 'admin' && senha == '123') {
        Navigator.pushReplacementNamed(context, WelcomeScreen.route);
      } else {
        // Mostra erro se estiver errado
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Credenciais inválidas. Use e-mail: admin e senha: 123.'),
          ),
        );
      }
    }
  }

  // Interface da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange, // fundo laranja
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420), // Para desktop também
          child: Card(
            margin: const EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey, // Conecta o form à chave
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/4.png',
                      height: 200,
                      fit: BoxFit.contain,
                    ),                    const SizedBox(height: 16),
                    Text('Login', style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 24),

                    // Campo de e-mail
                    TextFormField(
                      controller: _emailCtrl,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        hintText: 'admin',
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (v) => (v == null || v.isEmpty)
                          ? 'Informe o e-mail'
                          : null,
                    ),
                    const SizedBox(height: 12),

                    // Campo de senha
                    TextFormField(
                      controller: _senhaCtrl,
                      obscureText: _obscure, // Esconde ou mostra
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => setState(() => _obscure = !_obscure),
                        ),
                      ),
                      validator: (v) => (v == null || v.isEmpty)
                          ? 'Informe a senha'
                          : null,
                    ),
                    const SizedBox(height: 20),

                    // Botão Entrar
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.login),
                        label: const Text('Entrar'),
                        onPressed: _login,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
