// Dada uma lista de strings, crie uma nova lista que contenha os mesmos elementos,
// mas na ordem inversa da lista original.
// O uso de List.reversed é permitido para fins de comparação,
// mas a implementação principal deve usar uma estrutura de repetição (for ou while).

import 'dart:io';

void main() {
  while (true) {
    List<String> lista_palavras = [];

    // Validar quantidade de palavras
    int? qtd;
    while (qtd == null) {
      stdout.write('\nQuantas palavras deseja inserir na lista? ');
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
      String? palavra;
      while (palavra == null) {
        stdout.write('${i + 1}ª Palavra: ');
        String? entradaPalavra = stdin.readLineSync();

        if (entradaPalavra == null || entradaPalavra.trim().isEmpty) {
          print('Entrada inválida! Digite uma palavra válida.');
          continue;
        }

        palavra = entradaPalavra.trim();
      }

      lista_palavras.add(palavra);
    }

    // Processamento
    List<String> lista_invertida = [];

    for (int i = lista_palavras.length - 1; i >= 0; i--) {
      lista_invertida.add(lista_palavras[i]);
    }

    print('\nLista original: $lista_palavras');
    print('Lista invertida: $lista_invertida');

    // Apenas para comparação
    print('Lista invertida com reversed: ${lista_palavras.reversed.toList()}');

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
