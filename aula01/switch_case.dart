import 'dart:io';

void main() {
  print('1 - Número par');
  print('2 - Maior número');
  print('3 - Sair');

  // Entrada da opção com validação
  stdout.write('Escolha uma opção: ');
  String? entradaOpcao = stdin.readLineSync();
  int? opcao = int.tryParse(entradaOpcao ?? '');
  if (opcao == null) {
    print('Opção inválida! Digite um número.');
    return;
  }

  switch (opcao) {
    case 1:
      // Entrada de número com validação
      stdout.write('Digite um número: ');
      String? entradaNumero = stdin.readLineSync();
      int? numero = int.tryParse(entradaNumero ?? '');
      if (numero == null) {
        print('Valor inválido! Digite um número inteiro.');
        return;
      }

      if (numero % 2 == 0) {
        print('O número $numero é par!');
      } else {
        print('O número $numero é ímpar!');
      }
      break;

    case 2:
      // Entrada de dois números com validação
      stdout.write('Digite o valor de a: ');
      String? entradaA = stdin.readLineSync();
      int? a = int.tryParse(entradaA ?? '');
      if (a == null) {
        print('Valor inválido para A!');
        return;
      }

      stdout.write('Digite o valor de b: ');
      String? entradaB = stdin.readLineSync();
      int? b = int.tryParse(entradaB ?? '');
      if (b == null) {
        print('Valor inválido para B!');
        return;
      }

      if (a > b) {
        print('O número $a é maior que o número $b!');
      } else if (a < b) {
        print('O número $a é menor que o número $b!');
      } else {
        print('Os números são iguais!');
      }
      break;

    case 3:
      print('Saindo do programa...');
      break;

    default:
      print('Fora do intervalo de opções!');
  }
}
