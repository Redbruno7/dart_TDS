import 'dart:io';

void main(List<String> args) {
  stdout.write('Digite o valor de A: ');
  int a = int.parse(stdin.readLineSync()!);
  stdout.write('Digite o valor de B: ');
  int b = int.parse(stdin.readLineSync()!);

  int c;
  if (a == b) {
    c = a + b;
  } else {
    c = a * b;
  }

  print('Resultado: $c');
}