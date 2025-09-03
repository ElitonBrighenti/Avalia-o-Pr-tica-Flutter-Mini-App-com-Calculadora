import 'package:flutter/material.dart';
import '../components/app_drawer.dart';

class CalculatorScreen extends StatefulWidget {
  static const route = '/calculadora';
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = '';
  String _result = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == '=') {
        try {
          _calculate();
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Erro: divisão por zero')),
          );
        }
      } else if (value == 'C') {
        _expression = '';
        _result = '';
      } else {
        _expression += value;
      }
    });
  }

  void _calculate() {
    String exp = _expression
        .replaceAll(',', '.')
        .replaceAll('×', '*')
        .replaceAll('÷', '/');

    try {
      final double res = _eval(exp);
      if (res.isInfinite) {
        throw Exception('Divisão por zero');
      }
      _result = res.toString().replaceAll('.', ',');
    } catch (_) {
      _result = 'Erro';
    }
  }

  double _eval(String expr) {
    String operator = '';

    if (expr.contains('+')) {
      operator = '+';
    } else if (expr.contains('-')) {
      operator = '-';
    } else if (expr.contains('*')) {
      operator = '*';
    } else if (expr.contains('/')) {
      operator = '/';
    }

    switch (operator) {
      case '+':
        var parts = expr.split('+');
        return double.parse(parts[0]) + double.parse(parts[1]);
      case '-':
        var parts = expr.split('-');
        return double.parse(parts[0]) - double.parse(parts[1]);
      case '*':
        var parts = expr.split('*');
        return double.parse(parts[0]) * double.parse(parts[1]);
      case '/':
        var parts = expr.split('/');
        return double.parse(parts[0]) / double.parse(parts[1]);
      default:
        return double.parse(expr); // nenhum operador encontrado
    }
  }


  @override
  Widget build(BuildContext context) {
    final buttons = [
      '7','8','9','÷',
      '4','5','6','×',
      '1','2','3','-',
      '0',',','=','+',
      'C'
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora')),
      drawer: const AppDrawer(),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400), // limite largura
          child: Column(
            children: [
              // Display
              Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.centerRight,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _expression,
                      style: const TextStyle(fontSize: 24, color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _result,
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              // Grid de botões
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final value = buttons[index];
                    final isOperator = ['÷','×','-','+','='].contains(value);
                    final isClear = value == 'C';

                    Color bgColor;
                    Color fgColor = Colors.black87;

                    if (isClear) {
                      bgColor = Colors.red;
                      fgColor = Colors.white;
                    } else if (isOperator) {
                      bgColor = Colors.orange;
                      fgColor = Colors.white;
                    } else {
                      bgColor = Theme.of(context).colorScheme.secondaryContainer;
                    }

                    return AspectRatio(
                      aspectRatio: 1, // mantém quadrado
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: bgColor,
                          foregroundColor: fgColor,
                          textStyle: const TextStyle(fontSize: 22),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // cantos arredondados
                          ),
                        ),
                        onPressed: () => _onButtonPressed(value),
                        child: Text(value),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
