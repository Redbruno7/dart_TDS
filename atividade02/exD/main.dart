// Receber valor para ano
// Verificar se é ano bissexto

import 'dart:io';

void main() {
  bool repetir = true;

  while (repetir) {
    int? ano;

    // Ler valor de ano
    while (ano == null) {
      stdout.write('\nDigite um ano: ');
      String? entradaAno = stdin.readLineSync();

      if (entradaAno == null || entradaAno.isEmpty) {
        print('Entrada inválida! Digite um valor inteiro positivo.');
        continue;
      }

      ano = int.tryParse(entradaAno);
      if (ano == null || ano <= 0) {
        print('Ano inválido! Digite um valor inteiro positivo.');
        ano = null;
      }
    }

    // Processamento
    bool bissexto = (ano % 4 == 0 && ano % 100 != 0) || (ano % 400 == 0);

    if (bissexto) {
      print('\nO ano $ano é bissexto.');
    } else {
      print('\nO ano $ano não é bissexo.');
    }

    // Reiniciar sistema
    String? reinicio;

    while (reinicio == null || (reinicio.toLowerCase() != 'n' && reinicio.toLowerCase() != 's')) {
      stdout.write('\nDeseja repetir? (s/n): ');
      reinicio = stdin.readLineSync();

      if (reinicio == null || (reinicio.toLowerCase() != 'n' && reinicio.toLowerCase() != 's')) {
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