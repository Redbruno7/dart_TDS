// Dada uma lista de palavras, crie uma nova lista de inteiros
// onde cada inteiro representa o número de caracteres da palavra correspondente na lista original.

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

    // Validar palavras
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
    List<int> lista_tamanhos = [];

    for (var palavra in lista_palavras) {
      lista_tamanhos.add(palavra.length);
    }

    if (lista_tamanhos.isEmpty) {
      print('\nNenhuma palavra válida para processar.');
    } else {
      print('\nLista original: $lista_palavras');
      print('Lista de tamanhos: $lista_tamanhos');
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
