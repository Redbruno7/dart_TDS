import 'dart:io';

void main(List<String> args) {
  stdout.write('Digita a medida em metros: ');
  double m = double.parse(stdin.readLineSync()!);

  print('Centímetros: ${m * 100}');
  print('Milímeltro: ${m * 1000}');
  print('Quilômetros: ${m / 1000}');
}