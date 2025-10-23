// Receber valores para Tempo (s) e Aceleração Constante (a)
// Imprimir Velocidade a cada segundo até o Tempo informado

import 'dart:io';

void main() {
  bool repetir = true;

  while (repetir) {
    int? tempo;
    double? acelerecao;

    // Ler valor de tempo
    while (tempo == null) {
      stdout.write('\nDigite um valor para tempo (s): ');
      String? entradaTempo = stdin.readLineSync();

      if (entradaTempo == null || entradaTempo.isEmpty) {
        print('Entrada inválida!');
        continue;
      }

      tempo = int.tryParse(entradaTempo);
      if (tempo == null || tempo <= 0) {
        print('Valor inválido!');
        tempo = null;
      }
    }

    // Ler valor de aceleração constante
    while (acelerecao == null) {
      stdout.write('\nDigite um valor para aceleração constante (m/s²): ');
      String? entradaAceleracao = stdin.readLineSync();

      if (entradaAceleracao == null || entradaAceleracao.isEmpty) {
        print('Entrada inválida!');
        continue;
      }

      acelerecao = double.tryParse(entradaAceleracao);
      if (acelerecao == null || acelerecao <= 0) {
        print('Valor inválido!');
        acelerecao = null;
      }
    }

    // Processamento
    print('\nVelocidade a cada segundo:\n');
    for (int t = 1; t <= tempo; t++) {
      double velocidade = acelerecao * t;
      print('t = ${t}s -> Velocidade = ${velocidade.toStringAsFixed(2)} m/s');
    }

    // Reiniciar sistema
    String? reinicio;
    while (reinicio == null ||
        (reinicio.toLowerCase() != 'n' && reinicio.toLowerCase() != 's')) {
      stdout.write('\nDeseja repetir? (s/n): ');
      reinicio = stdin.readLineSync();

      if (reinicio == null ||
          (reinicio.toLowerCase() != 'n' && reinicio.toLowerCase() != 's')) {
        print('Resposta inválida!');
      }
    }

    if (reinicio == 'n') {
      print('\nEncerrando sistema...\n');
      repetir = false;
    } else {
      print('-' * 80);
    }
  }
}
