// Dada uma lista de palavras (strings),
// filtre e colete em uma nova lista apenas as palavras que satisfazem duas condições simultâneas:
// 1) o comprimento da palavra deve ser maior que 5 caracteres;
// 2) a palavra deve começar com a letra 'A' (maiúscula ou minúscula).

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
    List<String> palavras_filtradas = [];

    for (String p in lista_palavras) {
      if (p.length > 5 && p.toLowerCase().startsWith('a')) {
        palavras_filtradas.add(p);
      }
    }

    print('\nLista original: $lista_palavras');

    if (palavras_filtradas.isEmpty) {
      print('Nenhuma palavra atende aos critérios.');
    } else {
      print(
        'Palavras que começam com "A" e têm mais de 5 letras: $palavras_filtradas',
      );
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
