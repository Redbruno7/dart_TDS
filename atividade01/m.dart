import 'dart:io';

void main() {
  int? a;
  int? b;

  // Ler o valor de A
  while (a == null) {
    stdout.write('Digite o valor de A: ');
    String? entrada = stdin.readLineSync();

    if (entrada == null || entrada.isEmpty) {
      print('Você precisa digitar algo!');
      continue;
    }

    a = int.tryParse(entrada);
    if (a == null) {
      print('Valor inválido! Digite um número inteiro.');
    }
  }

  // Ler o valor de B
  while (b == null) {
    stdout.write('Digite o valor de B: ');
    String? entrada = stdin.readLineSync();

    if (entrada == null || entrada.isEmpty) {
      print('Você precisa digitar algo!');
      continue;
    }

    b = int.tryParse(entrada);
    if (b == null) {
      print('Valor inválido! Digite um número inteiro.');
    }
  }

  // Cálculo de C
  int c;
  if (a == b) {
    c = a + b;
  } else {
    c = a * b;
  }

  print('\nResultado: $c');
}