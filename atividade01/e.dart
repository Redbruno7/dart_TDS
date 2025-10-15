import 'dart:io';

void main(List<String> args) {
  stdout.write('Digite o primeiro número: ');
  double a = double.parse(stdin.readLineSync()!);

  stdout.write('Digite o segundo número: ');
  double b = double.parse(stdin.readLineSync()!);

  if (b == 0) {
    print('ERRO - Não é possível fazer divisão por zero!');
  } else {
    print('Resultado: ${(a / b).toStringAsFixed(4)}');
  }
}