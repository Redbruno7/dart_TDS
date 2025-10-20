import 'dart:io';

void main() {
  bool repetir = true;

  while (repetir) {
    int? a;
    int? b;

    // Ler o valor de A
    while (a == null) {
      stdout.write('Digite o valor de A: ');
      String? entrada = stdin.readLineSync();

      if (entrada == null || entrada.isEmpty) {
        print('Entrada inválida! Tente novamente.');
        continue;
      }

      a = int.tryParse(entrada);
      if (a == null) {
        print('Valor inválido! Tente novamente.');
      }
    }

    // Ler o valor de B
    while (b == null) {
      stdout.write('Digite o valor de B: ');
      String? entrada = stdin.readLineSync();

      if (entrada == null || entrada.isEmpty) {
        print('Entrada inválida! Tente novamente.');
        continue;
      }

      b = int.tryParse(entrada);
      if (b == null) {
        print('Valor inválido! Tente novamente.');
      }
    }

    // Operações
    int soma = a + b;
    int subtracao = a - b;
    int multiplicacao = a * b;

    double? divisao;
    int? resto;
    int? divisaoInteira;

    if (b != 0) {
      divisao = a / b;
      resto = a % b;
      divisaoInteira = a ~/ b;
    }

    // Resultados
    print('\nResultados:');
    print('Soma: $soma');
    print('Subtração: $subtracao');
    print('Multiplicação: $multiplicacao');

    if (b == 0) {
      print('Divisão: ERRO - Não é possível dividir por zero!');
      print('Resto da divisão: ERRO - Não é possível dividir por zero!');
      print('Divisão inteira: ERRO - Não é possível dividir por zero!');
    } else {
      print('Divisão: $divisao');
      print('Resto da divisão: $resto');
      print('Divisão inteira: $divisaoInteira');
    }

    // Perguntar se quer repetir
    String? resposta;
    while (resposta == null || (resposta.toLowerCase() != 's' && resposta.toLowerCase() != 'n')) {
      stdout.write('\nDeseja realizar outra operação? (s/n): ');
      resposta = stdin.readLineSync();

      if (resposta == null || (resposta.toLowerCase() != 's' && resposta.toLowerCase() != 'n')) {
        print("Resposta inválida!");
      }
    }

    if (resposta.toLowerCase() == 'n') {
      repetir = false;
      print('\nEncerrando o programa...\n');
    } else {
      print('\n-----------------------------------\n');
    }
  }
}