// Dada uma lista de números inteiros (positivos, negativos e zero),
// crie uma nova lista onde todos os números positivos aparecem primeiro,
// seguidos pelos números não-positivos (zero e negativos).
// A ordem relativa dentro de cada grupo deve ser mantida.

import 'dart:io';

void main() {
  while (true) {
    List<int> lista_numeros = [];

    // Validar quantidade de números
    int? qtd;
    while (qtd == null) {
      stdout.write('\nQuantos números deseja inserir na lista? ');
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

    // Validar números
    for (int i = 0; i < qtd; i++) {
      int? n;
      while (n == null) {
        stdout.write('\n${i + 1}º Número: ');
        String? entradaN = stdin.readLineSync();

        if (entradaN == null || entradaN.isEmpty) {
          print('Entrada inválida! Digite um número inteiro.');
          continue;
        }

        n = int.tryParse(entradaN);
        if (n == null) {
          print('Número inválido! Digite um número inteiro.');
        }
      }

      lista_numeros.add(n);
    }

    // Processamento
    List<int> positivos = [];
    List<int> nao_positivos = [];

    for (int n in lista_numeros) {
      if (n > 0) {
        positivos.add(n);
      } else {
        nao_positivos.add(n);
      }
    }

    List<int> lista_final = [...positivos, ...nao_positivos];

    print('\nLista original: $lista_numeros');
    print('Lista reorganizada (positivos primeiro): $lista_final');

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
