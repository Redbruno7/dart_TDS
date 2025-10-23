import 'dart:io';

void main() {
  bool repetir = true;

  while (repetir) {
    int? a;
    int? b;

    // Ler valor de A
    while (a == null) {
      stdout.write('\nDigite o primeiro número inteiro: ');
      String? entradaA = stdin.readLineSync();

      if (entradaA == null || entradaA.isEmpty) {
        print('Entrada inválida!');
        continue;
      }

      a = int.tryParse(entradaA);
      if (a == null || a <= 0) {
        print('Valor inválido! Informe um número inteiro positivo.');
        a = null;
      }
    }

    // Ler valor de B
    while (b == null) {
      stdout.write('\nDigite o segundo número inteiro: ');
      String? entradaB = stdin.readLineSync();

      if (entradaB == null || entradaB.isEmpty) {
        print('Entrada inválida!');
        continue;
      }

      b = int.tryParse(entradaB);
      if (b == null || b <= 0) {
        print('Valor inválido! Informe um número inteiro positivo.');
        b = null;
      }
    }

    // Processamento
    int x = a;
    int y = b;

    while (y != 0) {
      int resto = x % y;
      x = y;
      y = resto;
    }

    print('\nO MDC de $a e $b é: $x');

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
