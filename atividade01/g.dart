import 'dart:io';

void main() {
  double? n;
  
  while (n == null) {
    stdout.write('Digite um número: ');
    String? entrada = stdin.readLineSync();

    if (entrada == null || entrada.isEmpty) {
      print('Entrada inválida! Tente novamente.');
      continue;
    }

    n = double.tryParse(entrada);
    if (n == null) {
      print('Número inválido! Tente novamente.');
    }
  }
  
  // Processamento
  double dobro = n * 2;
  double triplo = n * 3;
  print('\nDobro: ${dobro.toStringAsFixed(2)}');
  print('Triplo: ${triplo.toStringAsFixed(2)}\n');
}