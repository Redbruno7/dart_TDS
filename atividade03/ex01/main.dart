// Em uma lista de números inteiros fornecido pelo usuário, filtrar apenas os pares maiores que 10
// Calcular a soma total dos números restantes

import 'dart:io';

void main() {
  while (true) {
    List<int> lista_numeros = [];

    // Ler valores dos números da lista
    stdout.write(
      '\nDigite uma lista de números inteiros separados por espaço: ',
    );
    String entradaNumeros = (stdin.readLineSync() ?? '').trim();

    if (entradaNumeros.isEmpty) {
      print('Nenhum número informado.');
    } else {
      List<String> partes = entradaNumeros.split(' ');

      for (var item in partes) {
        item = item.trim();
        if (item.isEmpty) continue;

        int? numero = int.tryParse(item);
        if (numero != null) {
          lista_numeros.add(numero);
        } else {
          print('Valor inválido ignorado: "$item"');
        }
      }

      // Processamento
      if (lista_numeros.isEmpty) {
        print('Nenhum número válido informado.');
      } else {
        List<int> pares = [];
        int soma = 0;

        for (var n in lista_numeros) {
          if (n % 2 == 0 && n > 10) {
            pares.add(n);
            soma += n;
          }
        }

        print('\nNúmeros pares maiores que 10: $pares');
        print('Soma total: $soma');
      }
    }

    // Reiniciar sistema
    while (true) {
      stdout.write('\nDeseja repetir? (s/n): ');
      String resposta = (stdin.readLineSync() ?? '').trim().toLowerCase();

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
