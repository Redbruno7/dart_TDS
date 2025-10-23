// Receber valores para Distância (m) e Tempo (s)
// Imprimir Velocidade Média (m/s)

import 'dart:io';

void main() {
  bool repetir = true;

  while (repetir) {
    double? distancia;
    double? tempo;

    // Ler valor de distância
    while (distancia == null) {
      stdout.write('\nDigite a distância percorrida (m): ');
      String? entradaDistancia = stdin.readLineSync();

      if (entradaDistancia == null || entradaDistancia.isEmpty) {
        print('Entrada inválida!');
        continue;
      }

      distancia = double.tryParse(entradaDistancia);
      if (distancia == null || distancia <= 0) {
        print('Valor inválido!');
        distancia = null;
      }
    }

    // Ler valor de tempo
    while (tempo == null) {
      stdout.write('\nDigite o tempo gasto (s): ');
      String? entradaTempo = stdin.readLineSync();

      if (entradaTempo == null || entradaTempo.isEmpty) {
        print('Entrada inválida!');
        continue;
      }

      tempo = double.tryParse(entradaTempo);
      if (tempo == null || tempo <= 0) {
        print('Valor inválido!');
        tempo = null;
      }
    }

    // Processamento
    double velocidadeMedia = distancia / tempo;

    print('\nVelocidade média: ${velocidadeMedia.toStringAsFixed(2)} m/s');

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

    if (reinicio.toLowerCase() == 'n') {
      print('\nEncerrando sistema...\n');
      repetir = false;
    } else {
      print('-' * 80);
    }
  }
}
