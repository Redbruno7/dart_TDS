// Receber valor para Ângulo (graus) e classificar como agudo, reto ou obtuso
import 'dart:io';

void main() {
  bool repetir = true;

  while (repetir) {
    double? angulo;

    // Ler valor do ângulo
    while (angulo == null) {
      stdout.write('\nDigite o valor do ângulo (em graus): ');
      String? entradaAngulo = stdin.readLineSync();

      if (entradaAngulo == null || entradaAngulo.isEmpty) {
        print('Entrada inválida!');
        continue;
      }

      angulo = double.tryParse(entradaAngulo);
      if (angulo == null || angulo <= 0 || angulo >= 180) {
        print('Valor inválido! Informe um ângulo entre 0 e 180.');
        angulo = null;
      }
    }

    // Processamento
    String classificacao;

    if (angulo < 90) {
      classificacao = 'Agudo';
    } else if (angulo == 90) {
      classificacao = 'Reto';
    } else {
      classificacao = 'Obtuso';
    }

    print('\nO ângulo de ${angulo.toStringAsFixed(1)}° é $classificacao.');

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
