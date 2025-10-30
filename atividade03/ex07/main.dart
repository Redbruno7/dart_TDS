// Dada uma lista de strings, crie uma única string (frase)
// concatenando apenas as palavras que terminam com a letra 'R' (maiúscula ou minúscula).
// As palavras devem ser separadas por um espaço na frase final.

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
      if (qtd == null || qtd < 2) {
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
    List<String> palavras_terminam_r = lista_palavras
        .where((palavra) => palavra.toLowerCase().endsWith('r'))
        .toList();

    String frase = palavras_terminam_r.join(' ');

    print('\nLista original: $lista_palavras');
    print(
      'Frase final (palavras que terminam com R): ${frase.isEmpty ? 'Nenhuma palavra atende aos critérios.' : frase}',
    );

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
