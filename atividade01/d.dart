import 'dart:io';

void main() {
  // Declarar flag
  double soma = 0;

  for (int i = 1; i <= 4; i++) {
    double? nota;

    while (nota == null) {
      stdout.write('Digite a $iª nota: ');
      String? entrada = stdin.readLineSync();

      // Tratativa de null safety
      if (entrada == null || entrada.trim().isEmpty) {
        print('Entrada inválida! Tente novamente.');
        continue;
      }

      // Tentativa de casting
      nota = double.tryParse(entrada);
      if (nota == null) {
        print('Entrada inválida! Tente novamente.');
      } else if (nota < 0 || nota > 10) {
        print('A nota deve estar entre 0 e 10.');
        nota = null;
      }
    }

    soma += nota;
  }

  double media = soma / 4;
  print('\nMédia = ${media.toStringAsFixed(2)}');
}