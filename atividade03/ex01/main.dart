// Em uma lista de números inteiros fornecido pelo usuário, filtrar apenas os pares maiores que 10
// Calcular a soma total dos números restantes

import 'dart:io';

void main() {
  while (true) {
    // Iniciar lista de números inteiros
    List<int> lista_numeros = [];

    // Validar quantidade de números
    int? qtd;
    while (qtd == null) {
      stdout.write('\nQuantos números deseja inserir na lista? ');
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

    // Validar números
    for (int i = 0; i < qtd; i++) {
      int? n;
      while (n == null) {
        stdout.write('${i + 1}º Número : ');
        String? entradaN = stdin.readLineSync();

        if (entradaN == null || entradaN.isEmpty) {
          print('Entrada inválida! Digite um número inteiro.');
          continue;
        }

        n = int.tryParse(entradaN);
        if (n == null) {
          print('Número inválido! Digite um número inteiro.');
        }
      }

      lista_numeros.add(n);
    }

    // Processamento
    List<int> paresMaioresQue10 = [];
    int soma = 0;

    for (int n in lista_numeros) {
      if (n % 2 == 0 && n > 10) {
        paresMaioresQue10.add(n);
        soma += n;
      }
    }

    print('\nLista original: $lista_numeros');
    if (paresMaioresQue10.isEmpty) {
      print('Nenhum número par maior que 10 foi encontrado.');
    } else {
      print('Números pares maiores que 10: $paresMaioresQue10');
      print('Soma total dos números restantes: $soma');
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
