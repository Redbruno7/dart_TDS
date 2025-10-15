import 'dart:io';

void main(List<String> args) {
  double soma = 0;

  for (int i = 1; i <= 4; i++) {
    stdout.write('Digite a $iª nota: ');
    soma += double.parse(stdin.readLineSync()!);
  }

  print('Média = ${soma / 4}');
}