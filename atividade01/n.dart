import 'dart:io';

void main(List<String> args) {
  stdout.write('Digite um número: ');
  double n = double.parse(stdin.readLineSync()!);

  if (n >= 0) {
    print('Dobro: ${n * 2}');
  } else {
    print('Triplo: ${n * 3}');
  }
}