import 'dart:io';

void main(List<String> args) {
  List<int> numeros = [];

  for (int i = 1; i <= 3; i++) {
    stdout.write('Digite o número $i: ');
    numeros.add(int.parse(stdin.readLineSync()!));
  }

  numeros.sort((a, b) => b.compareTo(a));
  print('Ordem decrescente: $numeros');
}