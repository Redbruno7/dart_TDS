// Fazer um programa que receba dois números inteiros A e B
// Imprimir todos os números primos entre A e B

import 'dart:io';
import 'dart:math';

void main() {
  bool repetir = true;

  while (repetir) {
    int? a;
    int? b;

    // Ler valor de A
    while (a == null) {
      stdout.write('\nDigite o valor de A: ');
      String? entradaA = stdin.readLineSync();

      if (entradaA == null || entradaA.isEmpty) {
        print('Entrada inválida! Digite um número inteiro.');
        continue;
      }

      a = int.tryParse(entradaA);
      if (a == null) {
        print('Valor inválido! Digite um número inteiro.');
      }
    }

    // Ler valor de B
    while (b == null) {
      stdout.write('\nDigite o valor de B: ');
      String? entradaB = stdin.readLineSync();

      if (entradaB == null || entradaB.isEmpty) {
        print('Entrada inválida! Digite um número inteiro.');
        continue;
      }

      b = int.tryParse(entradaB);
      if (b == null) {
        print('Valor inválido! Digite um número inteiro.');
      }
    }

    // Processamento
    int inicio = min(a, b);
    int fim = max(a, b);

    print('\nNúmeros primos entre $a e $b:');

    for (int i = inicio; i <= fim; i++) {
      if (i < 2) continue;

      bool primo = true;
      for (int j = 2; j * j <= i; j++) {
        if (i % j == 0) {
          primo = false;
          break;
        }
      }

      if (primo) {
        print(i);
      }
    }

    // Reiniciar sistema
    String? resposta_reinicio;
    while (resposta_reinicio == null ||
        (resposta_reinicio.toLowerCase() != 's' &&
            resposta_reinicio.toLowerCase() != 'n')) {
      stdout.write('\nDeseja repetir? (s/n): ');
      resposta_reinicio = stdin.readLineSync();

      if (resposta_reinicio == null ||
          (resposta_reinicio.toLowerCase() != 's' &&
              resposta_reinicio.toLowerCase() != 'n')) {
        print('Resposta inválida.');
      }
    }

    if (resposta_reinicio.toLowerCase() == 'n') {
      repetir = false;
      print('\nSistema encerrado.\n');
    } else {
      print('-' * 80);
    }
  }
}
