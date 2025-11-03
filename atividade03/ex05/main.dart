// Dada uma lista de números inteiros, encontre e imprima o segundo maior valor presente na lista.
// A lista pode conter duplicatas,
// mas o segundo maior valor deve ser o valor distinto que é imediatamente menor que o maior valor.

import 'dart:io';

void main() {
  while (true) {
    List<int> lista_numeros = [];

    // Validar quantidade de registros
    int? qtd;
    while (qtd == null) {
      stdout.write('\nQuantos números deseja inserir na lista? ');
      String? entradaQtd = stdin.readLineSync();

      if (entradaQtd == null || entradaQtd.isEmpty) {
        print('Entrada inválida! Digite um número maior que 2.');
        continue;
      }

      qtd = int.tryParse(entradaQtd);
      if (qtd == null || qtd < 2) {
        print('Quantidade inválida! Digite um número maior que 2.');
        qtd = null;
      }
    }

    // Validar números
    for (int i = 0; i < qtd; i++) {
      int? n;
      while (n == null) {
        stdout.write('${i + 1}º Número: ');
        String? entradaN = stdin.readLineSync();

        if (entradaN == null || entradaN.isEmpty) {
          print('Entrada inválida! Digite um número inteiro.');
          continue;
        }

        n = int.tryParse(entradaN);
        if (n == null) {
          print('Número inválido! Digite um número inteiro.');
        }
      }

      lista_numeros.add(n);
    }

    // Processamento
    List<int> numeros_unicos = [];

    for (int n in lista_numeros) {
      if (!numeros_unicos.contains(n)) {
        numeros_unicos.add(n);
      }
    }

    numeros_unicos.sort();

    if (numeros_unicos.length < 2) {
      print('\nNão é possível determinar o segundo maior valor.');
    } else {
      int segundo_maior = numeros_unicos[numeros_unicos.length - 2];
      print('\nLista original: $lista_numeros');
      print('Valores únicos ordenados: $numeros_unicos');
      print('Segundo maior valor distinto: $segundo_maior');
    }

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
