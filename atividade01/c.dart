import 'dart:io';

void main() {
  bool repetir = true;

  while (repetir) {
    int? ano;

    // Ano - Tratamento null safety
    while (ano == null) {
      stdout.write('Digite o ano de nascimento: ');
      String? entrada = stdin.readLineSync();

      if (entrada == null || entrada.isEmpty) {
        print('Entrada inválida! Tente novamente.');
        continue;
      }

      // Tratamento de casting
      ano = int.tryParse(entrada);
      if (ano == null) {
        print('Entrada inválida! Tente novamente.');
      }
    }

    int idade = DateTime.now().year - ano;
    print('Você tem $idade anos.');

    // Repetir?
    String? resposta;
    while (resposta == null || (resposta.toLowerCase() != 's' && resposta.toLowerCase() != 'n')) {
      stdout.write('\nDeseja realizar outra operação? (s/n): ');
      resposta = stdin.readLineSync();

      if (resposta == null || (resposta.toLowerCase() != 's' && resposta.toLowerCase() != 'n')) {
        print('Reposta inválida');
      }
    }

    if (resposta.toLowerCase() == 'n') {
      repetir = false;
      print('\nSistema encerrado.\n');
    } else {
      print('\n--------------------------------------------------');
    }
  }
}