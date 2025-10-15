import 'dart:io';

void main(List<String> args) {
  stdout.write('Digite um número: ');
  double n = double.parse(stdin.readLineSync()!);
  
  print('Dobro: ${n * 2}');
  print('Triplo: ${n * 3}');
}