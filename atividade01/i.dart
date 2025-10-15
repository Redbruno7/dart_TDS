import 'dart:io';

void main(List<String> args) {
  stdout.write('Digite um número inteiro: ');
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= 10; i++) {
    print('$n x $i = ${n * i}');
  }
}