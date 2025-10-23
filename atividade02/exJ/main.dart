// Receber um número inteiro positivo e realizar contagem repressiva a partir de até 0
import 'dart:io';

void main() {
  bool repetir = true;

  while (repetir) {
    int? numero;

    // Ler valor de número
    while (numero == null) {
      stdout.write('\nDigite um número inteiro positivo: ');
      String? entrada = stdin.readLineSync();

      if (entrada == null || entrada.isEmpty) {
        print('Entrada inválida!');
        continue;
      }

      numero = int.tryParse(entrada);
      if (numero == null || numero < 0) {
        print('Valor inválido! Informe um número inteiro maior ou igual a 0.');
        numero = null;
      }
    }

    // Processamento
    print('\nContagem regressiva:\n');
    for (int i = numero; i >= 0; i--) {
      print(i);
    }
    print('\nFim da contagem!\n');

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

    if (reinicio.toLowerCase() == 'n') {
      print('\nEncerrando sistema...\n');
      repetir = false;
    } else {
      print('-' * 80);
    }
  }
}
