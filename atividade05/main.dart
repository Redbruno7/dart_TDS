// Refatorar o exercício anterior em funções distintas
// Diminuir redundância do código

import 'dart:io';

void main() {
  List<Map<String, dynamic>> alunos = [];

  while (true) {
    clear();

    int opcao = menu();

    switch (opcao) {
      case 1:
        cadastrarAluno(alunos);
        break;

      case 2:
        listarDesempenho(alunos);
        break;

      case 3:
        atualizarNotas(alunos);
        break;

      case 4:
        print('\nEncerrando o sistema...\n');
        return;

      default:
        print('Opção inválida!');
    }

    stdout.write('\nPressione ENTER para voltar ao menu...');
    stdin.readLineSync();
  }
}

// Menu
int menu() {
  clear();

  print('=' * 70);
  print('SISTEMA DE DESEMPENHO ESCOLAR');
  print('=' * 70);
  print('1. Cadastrar aluno.');
  print('2. Listar alunos por desempenho.');
  print('3. Buscar aluno e atualizar notas.');
  print('4. Sair.');
  print('-' * 70);
  stdout.write('Escolha uma opção (1-4): ');

  String? entrada = stdin.readLineSync();
  return int.tryParse(entrada ?? '') ?? 0;
}

// Cadastrar aluno
void cadastrarAluno(List<Map<String, dynamic>> alunos) {
  stdout.write('\nNome do aluno: ');
  String? nome = stdin.readLineSync();

  if (nome == null || nome.trim().isEmpty) {
    print('Nome inválido!');
    return;
  }

  List<double> notas = lertNotas();

  alunos.add({'nome': nome, 'notas': notas});
  print('\nAluno cadastrado com sucesso!');
}

// Ler de notas
List<double> lertNotas() {
  List<double> notas = [];

  while (true) {
    stdout.write('Digite um nota (ENTER para terminar): ');
    String? entrada = stdin.readLineSync();

    if (entrada == null || entrada.isEmpty) break;

    double? nota = double.tryParse(entrada);

    if (nota == null || nota < 0 || nota > 10) {
      print('Nota inválida!\n');
    } else {
      notas.add(nota);
    }
  }

  return notas;
}

// Calcular média
double calcularMedia(List<double> notas) {
  double soma = 0;

  for (var n in notas) {
    soma += n;
  }

  return soma / notas.length;
}

// Listar desempenho
void listarDesempenho(List<Map<String, dynamic>> alunos) {
  List<Map<String, dynamic>> aprovados = [];
  List<Map<String, dynamic>> recuperacao = [];
  List<Map<String, dynamic>> reprovados = [];

  for (var aluno in alunos) {
    List<double> notas = aluno['notas'];

    if (notas.isEmpty) {
      print('\nO aluno(a) ${aluno['nome']} não possui notas cadastradas.');
      continue;
    }

    double media = calcularMedia(notas);
    aluno['media'] = media;

    if (media >= 7) {
      aprovados.add(aluno);
    } else if (media >= 5) {
      recuperacao.add(aluno);
    } else {
      reprovados.add(aluno);
    }
  }

  imprimirCategora('ALUNOS APROVADOS', aprovados);
  imprimirCategora('ALUNOS EM RECUPERAÇÃO', recuperacao);
  imprimirCategora('ALUNOS REPROVADOS', reprovados);

  if (aprovados.isEmpty && recuperacao.isEmpty && reprovados.isEmpty) {
    print('\nNenhum aluno foi classificado ainda.');
  }
}

// Imprimir categoria
void imprimirCategora(String titulo, List<Map<String, dynamic>> lista) {
  print('\n=== $titulo ===');

  if (lista.isEmpty) {
    print('Nenhum aluno nesta categoria.');
    return;
  }

  for (var aluno in lista) {
    print('${aluno['nome']} - Média: ${aluno['media']!.toStringAsFixed(2)}');
  }
}

// Atualizar notas
void atualizarNotas(List<Map<String, dynamic>> alunos) {
  stdout.write('\nDigie o nome do aluno que deseja atualizar: ');
  String? busca = stdin.readLineSync();

  if (busca == null || busca.trim().isEmpty) {
    print('Nome inválido!');
    return;
  }

  for (var aluno in alunos) {
    if (aluno['nome'].toString().toLowerCase() == busca.toLowerCase()) {
      print('\nAluno encontrado: ${aluno['nome']}');
      print('Notas atuais: ${aluno['notas']}\n');

      print('Digite as novas notas:');
      aluno['notas'] = lertNotas();

      print('\nNotas atualizadas com sucesso!');
      return;
    }
  }

  print('Aluno não encontrado!\n');
}

void clear() {
  // Código ANSI para limpar tela e mover cursor para o topo
  print("\x1B[2J\x1B[0;0H");
}
