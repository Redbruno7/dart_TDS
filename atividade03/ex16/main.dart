// Dadas duas listas de inteiros,
// crie uma nova lista contendo apenas os elementos que estão presentes em ambas as listas (a interseção).

import 'dart:io';

void main() {
  while (true) {
    List<int> lista1 = [];
    List<int> lista2 = [];

    // Validar quantidade de números da primeira lista
    int? qtd1;
    while (qtd1 == null) {
      stdout.write('\nQuantos números deseja inserir na primeira lista? ');
      String? entradaQtd1 = stdin.readLineSync();

      if (entradaQtd1 == null || entradaQtd1.isEmpty) {
        print('Entrada inválida! Digite um número maior que 0.');
        continue;
      }

      qtd1 = int.tryParse(entradaQtd1);
      if (qtd1 == null || qtd1 <= 0) {
        print('Quantidade inválida! Digite um número maior que 0.');
        qtd1 = null;
      }
    }

    // Validar quantidade de números da segunda lista
    int? qtd2;
    while (qtd2 == null) {
      stdout.write('\nQuantos números deseja inserir na segunda lista? ');
      String? entradaQtd2 = stdin.readLineSync();

      if (entradaQtd2 == null || entradaQtd2.isEmpty) {
        print('Entrada inválida! Digite um número maior que 0.');
        continue;
      }

      qtd2 = int.tryParse(entradaQtd2);
      if (qtd2 == null || qtd2 <= 0) {
        print('Quantidade inválida! Digite um número maior que 0.');
        qtd2 = null;
      }
    }

    // Validar números da primeira lista
    for (int i = 0; i < qtd1; i++) {
      int? n1;
      while (n1 == null) {
        stdout.write('\n${i + 1}º Número da 1ª lista: ');
        String? entradaN = stdin.readLineSync();

        if (entradaN == null || entradaN.isEmpty) {
          print('Entrada inválida! Digite um número inteiro.');
          continue;
        }

        n1 = int.tryParse(entradaN);
        if (n1 == null) {
          print('Número inválido! Digite um número inteiro.');
        }
      }

      lista1.add(n1);
    }

    // Validar números da segunda lista
    for (int i = 0; i < qtd2; i++) {
      int? n2;
      while (n2 == null) {
        stdout.write('\n${i + 1}º Número da 2ª lista: ');
        String? entradaN = stdin.readLineSync();

        if (entradaN == null || entradaN.isEmpty) {
          print('Entrada inválida! Digite um número inteiro.');
          continue;
        }

        n2 = int.tryParse(entradaN);
        if (n2 == null) {
          print('Número inválido! Digite um número inteiro.');
        }
      }

      lista2.add(n2);
    }

    // Processamento
    List<int> intersecao = [];

    for (int n1 in lista1) {
      for (int n2 in lista2) {
        if (n1 == n2 && !intersecao.contains(n1)) {
          intersecao.add(n1);
        }
      }
    }

    print('\nInterseção das listas:');
    if (intersecao.isEmpty) {
      print('Nenhum número em comum.');
    } else {
      print(intersecao);
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
