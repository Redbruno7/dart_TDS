import 'dart:io';

void main(List<String> args) {
  stdout.write('Digite um número: ');
  int n = int.parse(stdin.readLineSync()!);

  if (n % 2 == 0) {
    print('Resultado: ${n + 5}');
  } else {
    print('Resultado: ${n + 8}');
  }
}