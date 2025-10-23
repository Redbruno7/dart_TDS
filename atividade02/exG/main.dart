// Receber um número inteiro N e imprimir as potências de 2, partindo do 0 até N

import 'dart:io';
import 'dart:math';

void main() {
  bool repetir = true;

  while (repetir) {
    int? n;

    // Ler valor de N
    while (n == null) {
      stdout.write('\nDigite um valor para N: ');
      String? entradaN = stdin.readLineSync();

      if (entradaN == null || entradaN.isEmpty) {
        print('Entrada inválida!');
        continue;
      }

      n = int.tryParse(entradaN);
      if (n == null || n <= 0) {
        print('Valor inválido!');
        n = null;
      }
    }

    // Processamento
    print('\nPotências de 2 (de 2^0 até 2^$n):\n');
    for (int i = 0; i <= n; i++) {
      int potencia = pow(2, i).toInt();
      print('2^$i = $potencia');
    }

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
      print('\nEncerrando sistema...\n');
      repetir = false;
    } else {
      print('-' * 80);
    }
  }
}
