// Receber um valor em Joules (J) e converta para Calorias (cal)

import 'dart:io';

void main() {
  bool repetir = true;

  while (repetir) {
    double? joules;

    // Ler valor de Joules
    while (joules == null) {
      stdout.write('\nDigite um valor para Joules (J): ');
      String? entradaJoule = stdin.readLineSync();

      if (entradaJoule == null || entradaJoule.isEmpty) {
        print('Entrada inválida!');
        continue;
      }

      joules = double.tryParse(entradaJoule);
      if (joules == null || joules <= 0) {
        print('Valor inválido!');
        joules = null;
      }
    }

    // Processamento
    double calorias = joules / 4.1868;
    print('\n$joules J equivalem a ${calorias.toStringAsFixed(4)} cal');

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
