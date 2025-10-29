// Percorra uma lista de números inteiros.
// Para cada número, verifique se ele é ímpar.
// Se for ímpar, ele deve ser multiplicado por 2.
// Se for par, ele deve permanecer inalterado.
// O resultado final deve ser uma nova lista com os valores transformados.

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
        stdout.write('${i + 1}º Número: ');
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
    List<int> lista_transformada = [];

    for (int n in lista_numeros) {
      if (n % 2 == 0) {
        lista_transformada.add(n * 2);
      } else {
        lista_transformada.add(n);
      }
    }

    print('\nLista original: $lista_numeros');
    print('Lista transformada: $lista_transformada');

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
