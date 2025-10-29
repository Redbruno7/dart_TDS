// Considere uma lista de notas de alunos.
// O exercício exige que se descarte a menor nota da lista e, em seguida, calcule a média aritmética das notas restantes.
// O resultado deve ser um número decimal (double).


import 'dart:io';

void main() {
  while (true) {
    List<double> lista_notas = [];

    // Validar quantidade de notas
    int? qtd;
    while (qtd == null) {
      stdout.write('\nQuantas notas deseja inserir na lista? ');
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

    // Validar notas
    for (int i = 0; i < qtd; i++) {
      double? nota;
      while (nota == null) {
        stdout.write('${i + 1}ª Nota: ');
        String? entradaNota = stdin.readLineSync();

        if (entradaNota == null || entradaNota.isEmpty) {
          print('Entrada inválida! Digite um valor entre 0 e 10.');
          continue;
        }

        nota = double.tryParse(entradaNota);
        if (nota == null || nota < 0 || nota > 10) {
          print('Nota inválida! Digite um valor entre 0 e 10.');
          nota = null;
        }
      }

      lista_notas.add(nota);
    }

    // Processamento
    if (lista_notas.length == 1) {
      print('\nApenas uma nota foi inserida. Não é possível descartar a menor nota.');
      print('Média: ${lista_notas[0]}');
    } else {
      double menor_nota = lista_notas.reduce((a, b) => a < b ? a : b);
      List<double> notas_restantes = List.from(lista_notas);
      notas_restantes.remove(menor_nota);

      double soma = notas_restantes.reduce((a, b) => a + b);
      double media = soma / notas_restantes.length;

      print('\nNotas originais: $lista_notas');
      print('Menor nota descartada: $menor_nota');
      print('Notas restantes: $notas_restantes');
      print('Média das notas restantes: ${media.toStringAsFixed(2)}');
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
