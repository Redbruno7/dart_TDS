import 'dart:io';

void main() {
  stdout.write('Digite o primeiro valor: ');
  double a = double.parse(stdin.readLineSync()!);

  stdout.write('Digite o segundo valor: ');
  double b = double.parse(stdin.readLineSync()!);

  print('Soma: ${a + b}');
  print('Subtração: ${a - b}');
  print('Multiplicação: ${a * b}');

  if (b == 0) {
    print('Divisão: ERRO - Não é possível dividir por zero!');
    print('Resto da divisão: ERRO - Não é possível dividir por zero!');
    print('Divisão inteira: ERRO - Não é possível dividir por zero!');
  } else {
    print('Divisão: ${a / b}');
    print('Resto da divisão: ${a % b}');
    print('Divisão inteira: ${a ~/ b}');
  }
}
