import 'dart:io';

void main() {
  bool repetir = true;

  while (repetir) {
    late double temperatura;

    // Ler valor da temperatura inicial
    while (true) {
      stdout.write('\nDigite a temperatura inicial do líquido (°C): ');
      String? entrada = stdin.readLineSync();

      if (entrada == null || entrada.trim().isEmpty) {
        print('Entrada inválida!');
        continue;
      }

      double? temp = double.tryParse(entrada.replaceAll(',', '.'));
      if (temp == null || temp <= 25) {
        print('Valor inválido! A temperatura inicial deve ser maior que 25°C.');
        continue;
      }

      temperatura = temp;
      break;
    }

    // Processamento
    print('\nSimulando resfriamento...\n');
    int segundos = 0;

    while (temperatura > 25) {
      print(
        't = ${segundos}s -> Temperatura = ${temperatura.toStringAsFixed(2)}°C',
      );
      temperatura *= 0.98;
      segundos++;
    }

    print(
      't = ${segundos}s -> Temperatura = ${temperatura.toStringAsFixed(2)}°C',
    );
    print(
      '\nO líquido atingiu a temperatura ambiente (25°C) em $segundos segundos.\n',
    );

    // Reiniciar sistema
    String? reinicio;
    while (reinicio == null ||
        (reinicio.toLowerCase() != 'n' && reinicio.toLowerCase() != 's')) {
      stdout.write('Deseja repetir? (s/n): ');
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
