// Dada uma lista de Maps, onde cada Map representa um usuário com as chaves:
// "nome" (String) e "idade" (int),
// filtre e colete em uma nova lista apenas os Maps dos usuários que são maiores de 18 anos.

import 'dart:io';

void main() {
  while (true) {
    // Iniciar listas de usuários
    List<String> nomes = [];
    List<int> idades = [];

    // Validar quantidade de usuários
    int? quantidade;
    while (quantidade == null) {
      stdout.write('\nQuantos usuários deseja cadastrar? ');
      String? entradaQuantidade = stdin.readLineSync();

      if (entradaQuantidade == null || entradaQuantidade.isEmpty) {
        print('Entrada inválida! Digite um número maior que 0.');
        continue;
      }

      quantidade = int.tryParse(entradaQuantidade);
      if (quantidade == null || quantidade <= 0) {
        print('Quantidade inválida! Digite um número maior que 0.');
        quantidade = null;
      }
    }

    // Validar nomes e idades
    for (int i = 0; i < quantidade; i++) {
      print('\nUsuário ${i + 1}:');

      // Nome
      String? nome;
      while (nome == null || nome.isEmpty) {
        stdout.write('Nome: ');
        String? entradaNome = stdin.readLineSync();

        if (entradaNome == null || entradaNome.trim().isEmpty) {
          print('Nome inválido!');
          continue;
        }

        nome = entradaNome.trim();
      }

      // Idade
      int? idade;
      while (idade == null) {
        stdout.write('Idade: ');
        String? entradaIdade = stdin.readLineSync();

        if (entradaIdade == null || entradaIdade.isEmpty) {
          print('Entrada inválida! Digite um número inteiro maior que 0.');
          continue;
        }

        idade = int.tryParse(entradaIdade);
        if (idade == null || idade <= 0) {
          print('Idade inválida! Digite um número maior que 0.');
          idade = null;
        }
      }

      // Adicionar valores as listas
      nomes.add(nome);
      idades.add(idade);
    }

    // Processamento
    List<String> nomes_maiores = [];
    List<int> idades_maiores = [];

    for (int i = 0; i < nomes.length; i++) {
      if (idades[i] > 18) {
        nomes_maiores.add(nomes[i]);
        idades_maiores.add(idades[i]);
      }
    }

    print('\nLista completa de usuários');
    for (int i = 0; i < nomes.length; i++) {
      print('Nome: ${nomes[i]}, Idade: ${idades[i]}');
    }

    print('\nUsuários maiores de 18 anos');
    for (int i = 0; i < nomes_maiores.length; i++) {
      print('Nome: ${nomes_maiores[i]}, Idade: ${idades_maiores[i]}');
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
