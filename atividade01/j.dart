import 'dart:io';

void main(List<String> args) {
  stdout.write('Digite o valor em reais: ');
  double reais = double.parse(stdin.readLineSync()!);

  double dolar = reais / 5.60;
  double euro = reais / 6.00;
  double won = reais * 230;

  print('Dólares: \$${dolar.toStringAsFixed(2)}');
  print('Euros: €${euro.toStringAsFixed(2)}');
  print('Wons: ₩${won.toStringAsFixed(2)}');
}