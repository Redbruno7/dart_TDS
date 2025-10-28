// Percorra uma lista de números inteiros.
// Para cada número, verifique se ele é ímpar.
// Se for ímpar, ele deve ser multiplicado por 2.
// Se for par, ele deve permanecer inalterado.
// O resultado final deve ser uma nova lista com os valores transformados.

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
          print('Valor inválido ignorado: $item');
        }
      }

      // Processamento
      if (lista_numeros.isEmpty) {
        print('Nenhum número válido informado.');
      } else {
        List<int> lista_transformada = [];

        for (var n in lista_numeros) {
          if (n % 2 != 0) {
            lista_transformada.add(n * 2);
          } else {
            lista_transformada.add(n);
          }
        }

        print('\nLista original: $lista_numeros');
        print('Lista transformada: $lista_transformada');
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
