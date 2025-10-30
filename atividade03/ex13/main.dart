// Dada a lista do exercício anterior (Produtos),
// Crie uma nova lista de strings onde cada string é um resumo formatado do produto, no formato: "Produto [Nome] - Estoque: [Estoque]".

import 'dart:io';

void main() {
  while (true) {
    List<String> lista_nomes = [];
    List<int> lista_estoque = [];

    // Validar quantidade de registros
    int? qtd;
    while (qtd == null) {
      stdout.write('\nQuantos registros deseja inserir na lista? ');
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

    // Validar nome e quantidade em estoque
    for (int i = 0; i < qtd; i++) {
      // Nome
      String? nome;
      while (nome == null) {
        stdout.write('\n${i + 1}º Produto: ');
        String? entradaNome = stdin.readLineSync();

        if (entradaNome == null || entradaNome.trim().isEmpty) {
          print('Entrada inválida! Digite um nome válido.');
          continue;
        }

        nome = entradaNome.trim();
      }

      // Estoque
      int? estoque;
      while (estoque == null) {
        stdout.write('Quantidade em estoque: ');
        String? entradaEstoque = stdin.readLineSync();

        if (entradaEstoque == null || entradaEstoque.isEmpty) {
          print('Entrada inválida! Digite um número inteiro.');
          continue;
        }

        estoque = int.tryParse(entradaEstoque);
        if (estoque == null || estoque < 0) {
          print('Número inválido! Digite um número inteiro.');
          estoque = null;
        }
      }

      lista_nomes.add(nome);
      lista_estoque.add(estoque);
    }

    // Processamento
    List<String> lista_resumo = [];

    for (int i = 0; i < lista_nomes.length; i++) {
      String resumo =
          'Produto: ${lista_nomes[i]} - Estoque: ${lista_estoque[i]}';
      lista_resumo.add(resumo);
    }

    print('\nLista de Produtos:');
    print('-' * 80);
    for (var item in lista_resumo) {
      print(item);
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
