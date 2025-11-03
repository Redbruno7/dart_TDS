// Dada uma lista de números inteiros,
// calcule o desvio padrão amostral de forma simplificada.
// O processo envolve:
// 1) calcular a média;
// 2) calcular a diferença entre cada número e a média, elevando ao quadrado;
// 3) somar os resultados;
// 4) dividir pela contagem de elementos menos 1;
// 5) tirar a raiz quadrada do resultado.

import 'dart:io';
import 'dart:math';

void main() {
  while (true) {
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
        stdout.write('\n${i + 1}º Número: ');
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
    double soma = 0;
    for (int n in lista_numeros) {
      soma += n;
    }

    double media = soma / lista_numeros.length;

    double soma_quadrados = 0;
    for (int n in lista_numeros) {
      soma_quadrados += pow(n - media, 2);
    }

    double variancia = soma_quadrados / (lista_numeros.length - 1);

    double desvio_padrao = sqrt(variancia);

    print('\nMédia: ${media.toStringAsFixed(2)}');
    print('Desvio padrão amostral: ${desvio_padrao.toStringAsFixed(2)}');

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
