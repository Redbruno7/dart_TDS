import 'dart:io';

void main() {
  // Declarando as variáveis com validação simples
  stdout.write('Entre com o valor de a: ');
  String? entradaA = stdin.readLineSync();
  int? a = int.tryParse(entradaA ?? '');
  if (a == null) {
    print('Valor inválido para A! Digite um número inteiro.');
    return;
  }

  stdout.write('Entre com o valor de b: ');
  String? entradaB = stdin.readLineSync();
  int? b = int.tryParse(entradaB ?? '');
  if (b == null) {
    print('Valor inválido para B! Digite um número inteiro.');
    return;
  }

  stdout.write('Entre com o valor de c: ');
  String? entradaC = stdin.readLineSync();
  int? c = int.tryParse(entradaC ?? '');
  if (c == null) {
    print('Valor inválido para C! Digite um número inteiro.');
    return;
  }

  // Verificando Verdadeiro
  bool proposicao1 = a > b; // true
  bool proposicao2 = b < c; // true

  print('VERDADEIRO -------------------------');
  print('$a > $b && $b < $c - Resposta: ${proposicao1 && proposicao2}');
  print('$a > $b || $b < $c - Resposta: ${proposicao1 || proposicao2}');
  print('');

  // Verificando o Falso
  bool proposicao3 = a < b; // false
  bool proposicao4 = b > c; // false

  print('FALSO ------------------------------');
  print('$a < $b && $b > $c - Resposta: ${proposicao3 && proposicao4}');
  print('$a < $b || $b > $c - Resposta: ${proposicao3 || proposicao4}');
  print('');

  // Negando um valor
  bool v = true;
  bool f = false;

  print('NEGANDO ----------------------------');
  print('Negando o V: ${!v}');
  print('Negando o F: ${!f}');
}