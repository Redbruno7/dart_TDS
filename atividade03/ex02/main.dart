// Dada uma lista de inteiros que contém valores duplicados,
// Determinar quantos valores únicos existem na lista.
// A solução deve percorrer a lista e construir uma nova coleção
// (ou usar um Set temporário, se permitido, ou uma lista auxiliar)
// Armazenando apenas os elementos que ainda não foram vistos,
// Reportando o total de elementos únicos ao final.

import 'dart:io';

void main() {
  while (true) {
    List<int> lista_numeros = [];

    // Validar quantidade de números
    int? qtd;
    while (qtd == null) {
      stdout.write('\nQuantos números deseja inserir na lista? ');
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

    // Validar números
    for (int i = 0; i < qtd; i++) {
      int? n;
      while (n == null) {
        stdout.write('${i + 1}º Número : ');
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

    print('\nLista original: $lista_numeros');
    print('Números únicos: $numeros_unicos');
    print('Total de elementos únicos: ${numeros_unicos.length}');

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
