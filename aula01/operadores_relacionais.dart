import 'dart:io';

void main() {
  // Declarando variáveis com validação simples
  stdout.write('Entre com o valor de a: ');
  String? entradaA = stdin.readLineSync();
  var a = int.tryParse(entradaA ?? '');
  if (a == null) {
    print('Valor inválido para A! Digite um número inteiro.');
    return;
  }

  stdout.write('Entre com o valor de b: ');
  String? entradaB = stdin.readLineSync();
  var b = int.tryParse(entradaB ?? '');
  if (b == null) {
    print('Valor inválido para B! Digite um número inteiro.');
    return;
  }

  // Verificando as variáveis
  print('-' * 70);
  print('$a == $b Resultado: ${a == b}');
  print('$a != $b Resultado: ${a != b}'); // ≠ é apenas texto
  print('$a > $b Resultado: ${a > b}');
  print('$a < $b Resultado: ${a < b}');
  print('$a >= $b Resultado: ${a >= b}'); // ≥ é apenas texto
  print('$a <= $b Resultado: ${a <= b}'); // ≤ é apenas texto

  // Podemos atribuir esses resultados em uma variável
  bool igual = a == b;
  print('Verificação de igualdade: $igual');
  print('-' * 70);
}