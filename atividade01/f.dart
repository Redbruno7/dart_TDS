import 'dart:io';

void main(List<String> args) {
  int? n;

  while (n == null) {
    stdout.write('Digite um número inteiro: ');
    String? entrada = stdin.readLineSync();

    if (entrada == null || entrada.isEmpty) {
      print('Entrada inválida! Tente novamente.');
      continue;
    }

    n = int.tryParse(entrada);
    if (n == null) {
      print('Entrada inválida! Tente novamente.');
    }
  }
  
  // Operação
  int antecessor = n - 1;
  int sucessor = n + 1;
  print('\nAntecessor: $antecessor, Sucessor: $sucessor\n');
}