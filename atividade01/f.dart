import 'dart:io';

void main(List<String> args) {
  stdout.write('Digite um número inteiro: ');
  int n = int.parse(stdin.readLineSync()!);
  print('Antecessor: ${n - 1}, Sucessor: ${n + 1}');
}