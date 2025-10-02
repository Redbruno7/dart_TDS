import 'dart:io';

void main() {
  stdout.write('Entre com valor de A: ');
  String? entradaA = stdin.readLineSync();
  int? a = int.tryParse(entradaA ?? '');
  if (a == null) {
    print('Valor inválido para A! Digite um número inteiro.');
    return; // encerra o programa
  }

  stdout.write('Entre com valor de B: ');
  String? entradaB = stdin.readLineSync();
  int? b = int.tryParse(entradaB ?? '');
  if (b == null) {
    print('Valor inválido para B! Digite um número inteiro.');
    return;
  }

  // Operador de soma
  int soma = a + b;
  // Operador de subtração
  int subtracao = a - b;
  // Operador de produto
  int produto = a * b;
  // Operador de divisão
  double divisao = a / b;
  // Operador de divisão inteira
  int divInteira = a ~/ b;
  // Operador de resto da divisão
  int restoDivisao = a % b;

  print('-' * 70);
  print('A soma de $a + $b = $soma');
  print('A subtração de $a - $b = $subtracao');
  print('A Multiplicação de $a * $b = $produto');
  print('A divisão de $a ÷ $b = ${divisao.toStringAsFixed(2)}');
  print('A divisão inteira de $a ~/ $b = $divInteira');
  print('O resto da divisão de $a % $b = $restoDivisao');
  print('-' * 70);
}
