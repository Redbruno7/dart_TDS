// Dadas duas listas de inteiros,
//Lista Principal e Lista Subconjunto,
// verifique se todos os elementos da Lista Subconjunto estão presentes na Lista Principal.
// O resultado deve ser um valor booleano (true ou false).

import 'dart:io';

void main() {
  while (true) {
    List<int> lista_principal = [];
    List<int> lista_subconjunto = [];

    int? qtd1;
    int? qtd2;

    // Validar quantidade de números na lista principal
    while (qtd1 == null) {
      stdout.write('\nQuantos números deseja inserir na lista principal? ');
      String? entradaQtd = stdin.readLineSync();

      if (entradaQtd == null || entradaQtd.isEmpty) {
        print('Entrada inválida! Digite um número maior que 0.');
        continue;
      }

      qtd1 = int.tryParse(entradaQtd);
      if (qtd1 == null || qtd1 <= 0) {
        print('Quantidade inválida! Digite um número maior que 0.');
        qtd1 = null;
      }
    }

    // Validar quantidade de números na lista subconjunto
    while (qtd2 == null) {
      stdout.write('\nQuantos números deseja inserir na lista subconjunto? ');
      String? entradaQtd = stdin.readLineSync();

      if (entradaQtd == null || entradaQtd.isEmpty) {
        print('Entrada inválida! Digite um número maior que 0.');
        continue;
      }

      qtd2 = int.tryParse(entradaQtd);
      if (qtd2 == null || qtd2 <= 0) {
        print('Quantidade inválida! Digite um número maior que 0.');
        qtd2 = null;
      }
    }

    // Validar números da lista principal
    for (int i = 0; i < qtd1; i++) {
      int? n;
      while (n == null) {
        stdout.write('\n${i + 1}º Número da lista principal: ');
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

      lista_principal.add(n);
    }

    // Validar números da lista subconjunto
    for (int i = 0; i < qtd2; i++) {
      int? n;
      while (n == null) {
        stdout.write('\n${i + 1}º Número da lista subconjunto: ');
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

      lista_subconjunto.add(n);
    }

    // Processamento
    bool subconjunto_valido = true;

    for (int n in lista_subconjunto) {
      if (!lista_principal.contains(n)) {
        subconjunto_valido = false;
        break;
      }
    }

    print('\nLista principal: $lista_principal');
    print('Lista subconjunto: $lista_subconjunto');
    print('\nResultado: $subconjunto_valido');

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
