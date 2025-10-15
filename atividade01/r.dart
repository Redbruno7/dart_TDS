import 'dart:io';

void main(List<String> args) {
  stdout.write('Digite a temperatura: ');
  double temp = double.parse(stdin.readLineSync()!);

  stdout.write('Converter para (C/F)? ');
  String tipo = stdin.readLineSync()!.toUpperCase();

  if (tipo == 'F') {
    print('Resultado: ${(temp * 9 / 5) + 32} ºF');
  } else if (tipo == 'C') {
    print('Resultado: ${(temp - 32) * 5 / 9} ºC');
  } else {
    print('Opção inválida!');
  }
}