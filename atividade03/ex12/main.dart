// Dada as listas:
// "nome" (String), 
// "estoque" (int)
// "ativo" (bool),
// Calcular a soma total do estoque de todos os produtos que estão com o status "ativo" = true.

import 'dart:io';

void main() {
  while (true) {
    List<String> lista_nomes = [];
    List<int> lista_estoque = [];
    List<bool> lista_ativos = [];

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

    // Validar nome, quantidade em estoque e ativo
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

      // Ativo
      bool? ativo;
      while(ativo == null) {
        stdout.write('O produto está ativo? (s/n): ');
        String? entradaAtivo = stdin.readLineSync();

        if (entradaAtivo == null || entradaAtivo.trim().isEmpty) {
          print('Entrada inválida! Digite "s" ou "n".');
          continue;
        }

        entradaAtivo = entradaAtivo.trim().toLowerCase();
        if (entradaAtivo == 's') {
          ativo = true;
        } else if (entradaAtivo == 'n') {
          ativo = false;
        } else {
          print('Entrada inválida! Digite "s" ou "n".');
        }
      }

      lista_nomes.add(nome);
      lista_estoque.add(estoque);
      lista_ativos.add(ativo);
    }

    // Processamento
    int soma_ativos = 0;
    for (int i = 0; i < lista_nomes.length; i++) {
      if (lista_ativos[i]) {
        soma_ativos += lista_estoque[i];
      }
    }

    print('\nProdutos ativos:');
    for (int i = 0; i < lista_nomes.length; i++) {
      if (lista_ativos[i]) {
        print(' ° ${lista_nomes[i]}: ${lista_estoque[i]} unidades.');
      }
    }
    print('\nSoma total do estoque dos procutos ativos: $soma_ativos');

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
