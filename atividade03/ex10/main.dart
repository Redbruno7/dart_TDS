// Dada uma lista de strings, crie uma nova lista que contenha os mesmos elementos,
// mas na ordem inversa da lista original.
// O uso de List.reversed é permitido para fins de comparação,
// mas a implementação principal deve usar uma estrutura de repetição (for ou while).

import 'dart:io';

void main() {
  while (true) {
    List<String> lista_original = [];

    // Ler palavras da lista
    stdout.write('\nDigite uma lista de palavras separadas por espaço: ');
    String entrada = (stdin.readLineSync() ?? '').trim();

    if (entrada.isEmpty) {
      print('Nenhuma palavra informada.');
    } else {
      List<String> partes = entrada.split(' ');

      for (var item in partes) {
        item = item.trim();
        if (item.isEmpty) continue;
        lista_original.add(item);
      }

      // Processamento
      if (lista_original.isEmpty) {
        print('Nenhuma palavra válida informada.');
      } else {
        List<String> lista_invertida = [];

        // Inverter usando for
        for (int i = lista_original.length - 1; i >= 0; i--) {
          lista_invertida.add(lista_original[i]);
        }

        print('\nLista original: $lista_original');
        print('Lista invertida: $lista_invertida');

        // Apenas para comparação, usando List.reversed
        print(
          'Lista invertida com reversed: ${lista_original.reversed.toList()}',
        );
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
