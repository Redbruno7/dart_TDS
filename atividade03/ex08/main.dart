// Dada uma lista de palavras, crie uma nova lista de inteiros
// onde cada inteiro representa o número de caracteres da palavra correspondente na lista original.

import 'dart:io';

void main() {
  while (true) {
    List<String> lista_palavras = [];

    // Ler palavras da lista
    stdout.write('\nDigite uma lista de palavras separadas por espaço: ');
    String entradaPalavras = (stdin.readLineSync() ?? '').trim();

    if (entradaPalavras.isEmpty) {
      print('Nenhuma palavra informada.');
    } else {
      List<String> partes = entradaPalavras.split(' ');

      for (var palavra in partes) {
        palavra = palavra.trim();
        if (palavra.isEmpty) continue;
        lista_palavras.add(palavra);
      }

      // Processamento
      if (lista_palavras.isEmpty) {
        print('Nenhuma palavra válida informada.');
      } else {
        List<int> lista_tamanhos = [];

        for (var palavra in lista_palavras) {
          lista_tamanhos.add(palavra.length);
        }

        print('\nLista original: $lista_palavras');
        print('Lista de tamanhos: $lista_tamanhos');
      }
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
