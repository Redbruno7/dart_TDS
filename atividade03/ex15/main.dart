// Dada a lista:
// tarefa com a chave "status" (String),
// conte e imprima o número total de tarefas para cada status distinto.

import 'dart:io';

void main() {
  while (true) {
    List<String> lista_tarefas = [];

    // Validar quantidade de tarefas
    int? qtd;
    while (qtd == null) {
      stdout.write('\nQuantas tarefas deseja inserir na lista? ');
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

    // Validar palavra
    for (int i = 0; i < qtd; i++) {
      String? tarefa;
      while (tarefa == null) {
        stdout.write('\n${i + 1}ª Tarefa: ');
        String? entradaTarefa = stdin.readLineSync();

        if (entradaTarefa == null || entradaTarefa.trim().isEmpty) {
          print('Entrada inválida! Digite uma tarefa válida.');
          continue;
        }

        tarefa = entradaTarefa.trim();
      }

      lista_tarefas.add(tarefa);
    }

    // Processamento
    List<String> status_unico = [];
    List<int> contagem = [];

    for (var status in lista_tarefas) {
      if (status_unico.contains(status)) {
        int indice = status_unico.indexOf(status);
        contagem[indice]++;
      } else {
        status_unico.add(status);
        contagem.add(1);
      }
    }

    print('\nTotal de tarefas por status:');
    for (int i = 0; i < status_unico.length; i++) {
      print('${status_unico[i]}: ${contagem[i]}');
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
