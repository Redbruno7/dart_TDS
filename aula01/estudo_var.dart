void main() {
  //Valores inteiros
  int idade = 50;

  // Valores com ponto flutuante
  double altura = 1.80;

  // Valores booleando
  bool opcao = true;

  // Valores do tipo String
  String nome = "John Doe";

  // Demonstração de inferência de tipo
  var teste = 'José';   // tipo inferido: String
  // teste = 100;       // ERRO: Não é possível atribuir int a uma variável do tipo String

  var numero = 10;    // tipo inferido: int
  // numero = 'dez';  // ERRO: Não é possível atribuir String a uma variável do tipo int

  // Saída formatada usando template strings
  print('-' * 70);
  print('Meu nome é $nome, tenho $idade anos.');
  print('Minha altura é ${altura.toStringAsFixed(2)}m.');
  print('Esta é uma aula de Dart? $opcao');
  print('-' * 70);
}