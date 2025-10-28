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

    // Ler valores dos números da lista
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
      if (lista_numeros.isEmpty) {
        print('Nenhum número válido informado.');
      } else {
        List<int> numeros_unicos = [];

        for (var n in lista_numeros) {
          if (!numeros_unicos.contains(n)) {
            numeros_unicos.add(n);
          }
        }

        print('\nNúmeros únicos: $numeros_unicos');
        print('Total de elementos únicos: ${numeros_unicos.length}');
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
