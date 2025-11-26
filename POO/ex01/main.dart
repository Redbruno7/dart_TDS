// Definição da classe Pessoa
class Pessoa {
  // Declaração do atributo "nome" do tipo String
  final String nome;

  // Declaração do atributo "idade" do tipo int
  final int idade;

  // Construtor da classe Pessoa
  Pessoa({
    // Parâmetro obrigatório, garante inicialização segura
    required this.nome,
    required this.idade,
  });

  // Método para exibir os dados da pessoa
  void exibirDados() {
    print('-' * 70);
    print('Nome: $nome');
    print('Idade: $idade');
    print('-' * 70);
  }
}

void main() {
  // Criação de uma instância (objeto) da classe Pessoa com o construtor
  Pessoa pessoa1 = Pessoa(nome: 'John Doe', idade: 25);

  // Chamada do método exibirDados() da instância pessoa1
  pessoa1.exibirDados();

  // Criação de outra instância (objeto) da classe Pessoa com o construtor
  Pessoa pessoa2 = Pessoa(nome: 'Jane Doe', idade: 30);

  // Chamada do método exibirDados() da instância pessoa2
  pessoa2.exibirDados();
}