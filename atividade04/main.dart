// Criação de um sistema de gerenciamento de desempenho escolar.
// uso de listas de mapas e manipulação de dados numéricos.
// Cada aluno deve ser representado por um mapa, chaves ‘nome’ (List<String>) e ‘notas’ (List<double>).
// Cadastras alunos, registrar notas e calcular média final de cada aluno.
// Acessar valores diretamente pelas chaves do mapa.
// Classificar em "Aprovado" (Média >= 7), "Recuperação" (5 <= Média < 7) e "Reprovado" (Média < 5).
// Listagem final agrupada por categora de aprovação.
// Utilizar laços de repetição e condicionais para percorrer e filtrar os dados.
// Tratamento de null safety.
// Implementar funcionalidade de busca por nome, para atualizar notas de um aluno já existente

import 'dart:io';

void main() {
  List<Map<String, dynamic>> alunos = [];

  while (true) {
    print('=' * 70);
    print('SISTEMA DE DESEMPENHO ESCOLAR');
    print('=' * 70);
    print('1. Cadastrar aluno.');
    print('2. Listar alunos por desempenho.');
    print('3. Buscar aluno e atualizar notas.');
    print('4. Sair.');
    print('-' * 70);
    stdout.write('Escolha uma opção (1-4): ');
    String? opcao = stdin.readLineSync();

    if (opcao == '1') {
      // Cadastro de aluno
      stdout.write('\nNome do aluno: ');
      String? nome = stdin.readLineSync();

      if (nome == null || nome.trim().isEmpty) {
        print('Nome inválido!\n');
        continue;
      }

      List<double> notas = [];
      while (true) {
        stdout.write('Digite uma nota (ENTER para terminar): ');
        String? entrada_nota = stdin.readLineSync();

        if (entrada_nota == null || entrada_nota.isEmpty) break;

        double? nota = double.tryParse(entrada_nota);
        if (nota == null || nota < 0 || nota > 10) {
          print('Nota inválida!\n');
        } else {
          notas.add(nota);
        }
      }

      alunos.add({'nome': nome, 'notas': notas});
      print('\nAluno cadastrado com sucesso!\n');

    } else if (opcao == '2') {
      // Listagem por desempenho
      List<Map<String, dynamic>> aprovados = [];
      List<Map<String, dynamic>> recuperacao = [];
      List<Map<String, dynamic>> reprovados = [];

      for (var aluno in alunos) {
        List<double>? notas = aluno['notas'];

        if (notas == null || notas.isEmpty) {
          print('O aluno ${aluno['nome']} não possui notas cadastradas.');
          continue;
        }

        double soma = 0;
        for (var n in notas) {
          soma += n;
        }

        double media = soma / notas.length;
        aluno['media'] = media;

        if (media >= 7) {
          aprovados.add(aluno);
        } else if (media >= 5) {
          recuperacao.add(aluno);
        } else {
          reprovados.add(aluno);
        }
      }

      print('\n=== ALUNOS APROVADOS ===');
      for (var a in aprovados) {
        print('${a['nome']} - Média: ${a['media']!.toStringAsFixed(2)}');
      }

      print('\n=== ALUNOS EM RECUPERAÇÃO ===');
      for (var a in recuperacao) {
        print('${a['nome']} - Média: ${a['media']!.toStringAsFixed(2)}');
      }

      print('\n=== ALUNOS REPROVADOS ===');
      for (var a in reprovados) {
        print('${a['nome']} - Média: ${a['media']!.toStringAsFixed(2)}');
      }

    } else if (opcao == '3') {
      // Buscar aluno e atualizar notas
      stdout.write('\nDigite o nome do aluno que deseja atualizar: ');
      String? busca = stdin.readLineSync();

      if (busca == null || busca.trim().isEmpty) {
        print('Nome inválido!\n');
        continue;
      }

      bool encontrado = false;

      for (var aluno in alunos) {
        if (aluno['nome'].toString().toLowerCase() == busca.toLowerCase()) {
          encontrado = true;
          print('\nAluno encontrado: ${aluno['nome']}');
          print('Notas atuais: ${aluno['notas']}');

          List<double> novas_notas = [];

          while (true) {
            stdout.write('Degite uma nova nota (ENTER para terminar): ');
            String? entrada_nova_nota = stdin.readLineSync();
            if (entrada_nova_nota == null || entrada_nova_nota.trim().isEmpty) break;

            double? nova_nota = double.tryParse(entrada_nova_nota);
            if (nova_nota == null || nova_nota < 0 || nova_nota > 10) {
              print('Nota inválida!\n');
            } else {
              novas_notas.add(nova_nota);
            }
          }

          aluno['notas'] = novas_notas;
          print('Notas atualizadas com sucesso!\n');
          break;
        }
      }

      if (!encontrado) {
        print('Aluno não encontrado!\n');
      }

    } else if (opcao == '4') {
      print('\nEncerrando o sistema...\n');
      break;

    } else {
      print('Opção inválida!\n');
    }
  }
}