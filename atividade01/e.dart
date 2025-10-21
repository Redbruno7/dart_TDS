import 'dart:io';

void main() {
  double? a;
  double? b;

  while (a == null) {
    stdout.write('Digite o valor de A: ');
    String? entrada = stdin.readLineSync();

    // Tratativa de null safety
    if (entrada == null || entrada.isEmpty) {
      print('Entrada inválida! Tente novamente.');
      continue;
    }

    // Tentativa de casting
    a = double.tryParse(entrada);
    if (a == null) {
      print('Entrada inválida! Tente novamente.');
    }
  }

  while (b == null) {
    stdout.write('Digite o valor de B: ');
    String? entrada = stdin.readLineSync();

    if (entrada == null || entrada.isEmpty) {
      print('Entrada inválida! Tente novamente.');
      continue;
    }

    b = double.tryParse(entrada);
    if (b == null) {
      print('Entrada inválida! Tente novamente.');
    }
  }

  // Cálculo
  if (b == 0) {
    print('ERRO - Não é possível fazer divisão por zero!');
  } else {
    double divisao = a / b;
    print('\nResultado: ${divisao.toStringAsFixed(2)}\n');
  }
}