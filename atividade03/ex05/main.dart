// Dada uma lista de números inteiros, encontre e imprima o segundo maior valor presente na lista.
// A lista pode conter duplicatas,
// mas o segundo maior valor deve ser o valor distinto que é imediatamente menor que o maior valor.

import 'dart:io';

void main() {
  while (true) {
    List<int> lista_numeros = [];

    // Ler valores da lista
    stdout.write(
      '\nDigite uma lista de números inteiros separados por espaço: ',
    );
    String entradaNumeros = (stdin.readLineSync() ?? '').trim();

    if (entradaNumeros.isEmpty) {
      print('Nenhum número informado.');
    } else {
      List<String> partes = entradaNumeros.split(' ');

      for (var item in partes) {
        item = item.trim();
        if (item.isEmpty) continue;

        int? numero = int.tryParse(item);
        if (numero != null) {
          lista_numeros.add(numero);
        } else {
          print('Valor inválido ignorado: "$item"');
        }
      }

      // Processamento
      if (lista_numeros.length < 2) {
        print(
          'É necessário pelo menos dois números distintos para encontrar o segundo maior.',
        );
      } else {
        // Criar uma lista de valores únicos
        List<int> numeros_unicos = [];
        for (var n in lista_numeros) {
          if (!numeros_unicos.contains(n)) numeros_unicos.add(n);
        }

        if (numeros_unicos.length < 2) {
          print(
            'Não há número distinto suficiente para determinar o segundo maior.',
          );
        } else {
          // Ordenar em ordem decrescente
          numeros_unicos.sort((a, b) => b.compareTo(a));

          // Segundo maior é o segundo elemento da lista ordenada
          int segundoMaior = numeros_unicos[1];

          print('\nSegundo maior valor distinto: $segundoMaior');
        }
      }
    }

    // Reiniciar sistema
    while (true) {
      stdout.write('\nDeseja repetir? (s/n): ');
      String resposta = (stdin.readLineSync() ?? '').trim().toLowerCase();

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
