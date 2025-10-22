// Ler um número inteiro positivo
// Calcular fatorial com loop (!n)

import 'dart:io';

void main() {
  bool repetir = true;

  while (repetir) {
    int? n;

    // Ler valor de N
    while (n == null) {
      stdout.write('\nDigite um número inteiro positivo: ');
      String? entradaN = stdin.readLineSync();

      if (entradaN == null || entradaN.isEmpty) {
        print('Entrada inválida! Digite um número inteiro positivo.');
        continue;
      }

      n = int.tryParse(entradaN);
      if (n == null) {
        print('Valor inválido! Digite um número inteiro positivo.');
      } else if (n <= 0) {
        print('Valor inválido. Digite um número inteiro positivo.');
        n = null;
      }
    }

    // Processamento
    BigInt fatorial = BigInt.one;

    for (int i = 1; i <= n; i++) {
      fatorial *= BigInt.from(i);
    }

    print('\nFatorial de $n (!$n) = $fatorial');

    // Reiniciar sistema
    String? reinicio;

    while (reinicio == null ||
        (reinicio.toLowerCase() != 'n' && reinicio.toLowerCase() != 's')) {
      stdout.write('\nDeseja repetir? (s/n): ');
      reinicio = stdin.readLineSync();

      if (reinicio == null ||
          (reinicio.toLowerCase() != 'n' && reinicio.toLowerCase() != 's')) {
        print('Resposta inválida.');
      }
    }

    if (reinicio == 'n') {
      repetir = false;
      print('\nSistema encerrado.\n');
    } else {
      print('-' * 80);
    }
  }
}
