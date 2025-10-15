import 'dart:io';

void main(List<String> args) {
  stdout.write('Digite o capital inicial: ');
  double c = double.parse(stdin.readLineSync()!);

  stdout.write('Digite a taxa de juros (%): ');
  double i  = double.parse(stdin.readLineSync()!) / 100;

  stdout.write('Digite o tempo (em meses): ');
  int t = int.parse(stdin.readLineSync()!);

  double juros = c * i * t;
  double montante = c + juros;

  print('Juros: R\$${juros.toStringAsFixed(2)}');
  print('Montante final: R\$${montante.toStringAsFixed(2)}');
}