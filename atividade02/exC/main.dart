// Receber um número inteiro N
// Imprimir a soma de todos os múltiplos de 3 ou 5 menores que N

import 'dart:io';

void main() {
  bool repetir = true;

  while (repetir) {
    int? n;

    // Ler valor de N
    while (n == null) {
      stdout.write('\nDigite um valor inteiro para N: ');
      String? entradaN = stdin.readLineSync();

      if (entradaN == null || entradaN.isEmpty) {
        print('Entrada inválida! Digite um número inteiro.');
        continue;
      }

      n = int.tryParse(entradaN);
      if (n == null || n <= 0) {
        print('Valor inválido! Digite um número inteiro positivo.');
        n = null;
      }
    }

    // Processamento
    int soma = 0;

    for (int i = 1; i < n; i++) {
      if (i % 3 == 0 || i % 5 == 0) {
        soma += i;
      }
    }

    print('\nSoma dos múltiplos de 3 e 5 menores que $n: \n$soma');

    // Reiniciar sistema
    String? reinicio;

    while (reinicio == null ||
        (reinicio.toLowerCase() != 'n' && reinicio.toLowerCase() != 's')) {
      stdout.write('\nDeseja repetir? (s/n): ');
      reinicio = stdin.readLineSync();

      if (reinicio == null ||
          (reinicio.toLowerCase() != 'n' && reinicio.toLowerCase() != 's')) {
        print('Resposta inválida!');
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
