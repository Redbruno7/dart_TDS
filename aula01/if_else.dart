import 'dart:io';
void main() {
  // Declaração de variáveis inteiras com validação
  stdout.write('Entre com o valor de a: ');
  String? entradaA = stdin.readLineSync();
  double? a = double.tryParse(entradaA ?? '');
  if (a == null) {
    print('Valor inválido para A! Digite um número válido.');
    return;
  }

  stdout.write('Entre com o valor de b: ');
  String? entradaB = stdin.readLineSync();
  double? b = double.tryParse(entradaB ?? '');
  if (b == null) {
    print('Valor inválido para B! Digite um número válido.');
    return;
  }

  // Condicional simples com else opcional
  print('Testando se "a" é maior que "b"');
  if (a > b) {
    print('Informação verdadeira!');
  } else {
    print('Informação falsa!');
  }

  print('Testando se "john" é diferente "Jane"');
  // Comparação de strings
  String nome = 'john';

  if (nome != 'Jane') {
    print('Os nomes são diferentes!');
  } else {
    print('Os nomes são iguais!');
  }

  // Condicionais encadeadas: avaliando a média de um aluno
  stdout.write('Digite a média do aluno (0 a 10): ');
  String? entradaMedia = stdin.readLineSync();
  double? media = double.tryParse(entradaMedia ?? '');
  if (media == null) {
    print('Valor inválido para Média! Digite um número válido.');
    return;
  }

  print('Testando a Média declarada (${media})');

  if (media < 0 || media > 10) {
    print('Média inválida! Digite um valor entre 0 e 10.');
  } else if (media >= 7.5) {
    print('O aluno foi aprovado!');
  } else if (media >= 5) {
    print('O aluno está em recuperação!');
  } else {
    print('O aluno foi reprovado!');
  }
}