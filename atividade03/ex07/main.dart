// Dada uma lista de strings, crie uma única string (frase)
// concatenando apenas as palavras que terminam com a letra 'R' (maiúscula ou minúscula).
// As palavras devem ser separadas por um espaço na frase final.

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
        List<String> palavras_terminam_r = [];

        for (var palavra in lista_palavras) {
          if (palavra.isNotEmpty &&
              palavra[palavra.length - 1].toUpperCase() == 'R') {
            palavras_terminam_r.add(palavra);
          }
        }

        // Criar a frase final separando palavras por espaço
        String frase = palavras_terminam_r.join(' ');

        print('\nLista original: $lista_palavras');
        print('Frase final (palavras que terminam com R): $frase');
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
