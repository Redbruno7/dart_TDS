// Dada uma lista de palavras (strings),
// filtre e colete em uma nova lista apenas as palavras que satisfazem duas condições simultâneas:
// 1) o comprimento da palavra deve ser maior que 5 caracteres;
// 2) a palavra deve começar com a letra 'A' (maiúscula ou minúscula).

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
        List<String> filtradas = [];

        for (var palavra in lista_palavras) {
          if (palavra.length > 5 && (palavra[0].toUpperCase() == 'A')) {
            filtradas.add(palavra);
          }
        }

        print('\nLista original: $lista_palavras');
        print(
          'Palavras filtradas (mais de 5 letras e começam com A): $filtradas',
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
