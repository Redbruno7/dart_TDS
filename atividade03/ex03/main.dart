import 'dart:io';

void main() {
  while (true) {
    List<double> lista_notas = [];

    // Ler valores das notas
    stdout.write('\nDigite uma lista de notas separadas por espaço: ');
    String entradaNotas = (stdin.readLineSync() ?? '').trim();

    if (entradaNotas.isEmpty) {
      print('Nenhuma nota informada.');
    } else {
      List<String> partes = entradaNotas.split(' ');

      for (var item in partes) {
        item = item.trim();
        if (item.isEmpty) continue;

        double? nota = double.tryParse(item);
        if (nota != null) {
          lista_notas.add(nota);
        } else {
          print('Valor inválido ignorado: "$item"');
        }
      }

      // Processamento
      if (lista_notas.isEmpty) {
        print('Nenhuma nota válida informada.');
      } else if (lista_notas.length == 1) {
        print('Apenas uma nota informada. Não é possível descartar a menor.');
      } else {
        // Descarta a menor nota
        double menorNota = lista_notas.reduce((a, b) => a < b ? a : b);
        lista_notas.remove(menorNota);

        // Calcula a média das notas restantes
        double soma = lista_notas.reduce((a, b) => a + b);
        double media = soma / lista_notas.length;

        print('\nNotas restantes: $lista_notas');
        print('Média das notas restantes: $media');
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
