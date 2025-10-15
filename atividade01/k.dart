import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  stdout.write('Lado do quadrado: ');
  double lado = double.parse(stdin.readLineSync()!);
  print('Área do quadrado: ${lado * lado}');

  stdout.write('Base do retângulo: ');
  double base = double.parse(stdin.readLineSync()!);
  stdout.write('Altura do retângulo: ');
  double altura = double.parse(stdin.readLineSync()!);
  print('Área do retângulo: ${base * altura}');

  stdout.write('Base do triângulo: ');
  double b = double.parse(stdin.readLineSync()!);
  stdout.write('Altura do triângulo: ');
  double h = double.parse(stdin.readLineSync()!);
  print('Área do triângulo: ${(b * h) / 2}');

  stdout.write('Raio do cículo: ');
  double r = double.parse(stdin.readLineSync()!);
  print('Área do círculo: ${pi * pow(r, 2)}');
}