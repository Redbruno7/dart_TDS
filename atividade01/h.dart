import 'dart:io';

void main() {
  double? m;

  while (m == null) {
    stdout.write('Digite a medida em metros: ');
    String? entrada = stdin.readLineSync();

    if (entrada == null || entrada.isEmpty) {
      print('Entrada inválida! Tente novamente.');
      continue;
    }

    m = double.tryParse(entrada);
    if (m == null) {
      print('Metragem inválida! Tente novamente.');
    }
  }

  double cm = m * 100;
  double mm = m * 1000;
  double km = m / 1000;

  print('\nCentímetros: ${cm.toStringAsFixed(2)}');
  print('Milímeltro: ${mm.toStringAsFixed(2)}');
  print('Quilômetros: ${km.toStringAsFixed(2)}\n');
}