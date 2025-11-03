// Dada uma lista de strings com valores duplicados e em ordem aleatória,
// o objetivo é primeiro remover todas as duplicatas e, em seguida,
// ordenar a lista resultante em ordem alfabética.

import 'dart:io';

void main() {
  while (true) {
    List<String> lista = [];

    // Validar quantidade de registros
    int? qtd;
    while (qtd == null) {
      stdout.write('\nQuantos registros deseja inserir na lista? ');
      String? entradaQtd = stdin.readLineSync();

      if (entradaQtd == null || entradaQtd.isEmpty) {
        print('Entrada inválida! Digite um número maior que 0.');
        continue;
      }

      qtd = int.tryParse(entradaQtd);
      if (qtd == null || qtd <= 0) {
        print('Quantidade inválida! Digite um número maior que 0.');
        qtd = null;
      }
    }

    // Validar palavra
    for (int i = 0; i < qtd; i++) {
      String? registro;
      while (registro == null) {
        stdout.write('\n${i + 1}º registro: ');
        String? entradaRegistro = stdin.readLineSync();

        if (entradaRegistro == null || entradaRegistro.trim().isEmpty) {
          print('Registro inválido! Digite uma String válido.');
          continue;
        }

        registro = entradaRegistro.trim();
      }

      lista.add(registro);
    }

    // Processamento
    List<String> lista_sem_duplicatas = [];
    for (String registro in lista) {
      if (!lista_sem_duplicatas.contains(registro)) {
        lista_sem_duplicatas.add(registro);
      }
    }

    lista_sem_duplicatas.sort();

    print('\nLista original: $lista');
    print('Lista sem duplicatas e ordenada: $lista_sem_duplicatas');

    // Reiniciar sistema
    while (true) {
      stdout.write('\nDeseja repetir? (s/n): ');
      String? resposta = stdin.readLineSync();

      if (resposta == null) continue;

      resposta = resposta.toLowerCase();
      if (resposta == 's') {
        print('-' * 80);
        break;
      } else if (resposta == 'n') {
        print('\nSistema encerrado.\n');
        return;
      } else {
        print('Resposta inválida.');
      }
    }
  }
}
