import 'dart:io';

class Pessoa {
  // Atributo "nome" do tipo String
  // (não pode ser nulo, sempre terá valor válido)
  String nome;

  // Atributo "idade" do tipo int
  // (não pode ser nulo, sempre terá valor válido)
  int idade;

  // Construtor padrão com valores seguros
  Pessoa({this.nome = 'Não informado', this.idade = 0});

  // Método para ler os dados da pessoa
  void lerDados() {
    stdout.write('Digite o nome: ');

    // Lê a linha digitada (String? porque pode vir nula)
    String? entradaNome = stdin.readLineSync();

    // Se a entrada for nula ou vazia, mantém "Não informado"
    if (entradaNome != null && entradaNome.isNotEmpty) {
      nome = entradaNome;
    }

    stdout.write('Digite a idade: ');

    // Lê a linha digitada (String? porque pode vir nula)
    String? entradaIdade = stdin.readLineSync();

    int? idadeConvertida = int.tryParse(entradaIdade ?? '');
    if (idadeConvertida != null) {
      idade = idadeConvertida;
    }
  }

  // Método para exibir o dados da pessoa formatados
  void exibirDados() {
    // Imprime uma linha divisória com 70 traços
    print('-' * 70);

    // Exibe o nome (nunca será nulo)
    print('Nome: $nome');

    // Exibe a idade (também nunca será nula)
    print('Idade: $idade');

    // Imprime outra linha divisória
    print('-' * 70);
  }
}

void main() {
  var pessoa = Pessoa();
  pessoa.lerDados();
  pessoa.exibirDados();
}
