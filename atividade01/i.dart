import 'dart:io';

void main() {
  int? n;

  while (n == null) {
    stdout.write('Digite um número inteiro: ');
    String? entrada = stdin.readLineSync();

    if (entrada == null || entrada.isEmpty) {
      print('Você precisa digitar algo!');
      continue;
    }

    n = int.tryParse(entrada);
    if (n == null) {
      print('Valor inválido! Digite um número inteiro.');
    }
  }

  print('\nTabuada do $n:');
  for (int i = 1; i <= 10; i++) {
    print('$n x $i = ${n * i}');
  }
}