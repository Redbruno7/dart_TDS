import 'dart:io';

void main(List<String> args) {
  stdout.write('Digite um número: ');
  int n = int.parse(stdin.readLineSync()!);

  if (n % 2 == 0) {
    print('O número é par.');
  } else {
    print('O número é ímpar.');
  }
}