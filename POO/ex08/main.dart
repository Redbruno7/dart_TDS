import 'dart:io';

class Aluno {
  String matricula;
  String nome;
  Map<String, double> notas;

  // Construtor com parâmetros nomeados (boa prática em Dart)
  Aluno({required this.matricula, required this.nome, required this.notas});

  // Sobrescrita (override) do método toString para exibir o boletim formatado
  @override
  String toString() {
    // Cálculo da média a partir dos valores do mapa de notas
    double media = notas.values.reduce((a, b) => a + b) / notas.length;

    // Retorna uma string formatada com as informações do aluno
    return '''
Boletim Escolar
------------------------------------------------
Matrícula: $matricula
Nome: $nome
Notas:
1º Bimestre: ${notas['n1']?.toStringAsFixed(2)}
2º Bimestre: ${notas['n2']?.toStringAsFixed(2)}
3º Bimestre: ${notas['n3']?.toStringAsFixed(2)}
4º Bimestre: ${notas['n4']?.toStringAsFixed(2)}
------------------------------------------------
Média Final: ${media.toStringAsFixed(2)}
Situação: ${media >= 6 ? 'Aprovado' : 'Reprovado'}
''';
  }
}

void main() {
  // Lista que irá armazenar vários alunos cadastrados
  List<Aluno> alunos = [];
  String opcao;

  // Loop para permitir cadastrar vários alunos
  do {
    stdout.write("Digite a matrícula do aluno: ");
    String matricula = stdin.readLineSync()!;

    stdout.write("Digite o nome do aluno: ");
    String nome = stdin.readLineSync()!;

    // Mapa para armazenar as 4 notas do aluno
    Map<String, double> notas = {};

    // Loop para coletar notas
    for (int i = 1; i <= 4; i++) {
      stdout.write("Digite a nota do $iº bimestre: ");
      // Converte a entrada de texto para double
      double nota = double.parse(stdin.readLineSync()!);
      notas["n$i"] = nota; // Armazena mapa: "n1": nota, "n2": nota...
    }

    // Cria um objeto Aluno usando o construtor com parâmetros nomeados
    alunos.add(Aluno(matricula: matricula, nome: nome, notas: notas));

    print("\nAluno cadastrado com sucesso!");

    // Pergunta se quer cadastrar outro aluno
    stdout.write("Deseja cadastrar outro aluno? (S/N) ");
    opcao = stdin.readLineSync()!.toUpperCase();
  } while (opcao == 'S');

  // Exibe todos os alunos cadastrados utilizando o toString
  print("\n======= LISTA DE ALUNOS CADASTRADOS =======\n");
  for (Aluno aluno in alunos) {
    print(aluno.toString());
  }
}
