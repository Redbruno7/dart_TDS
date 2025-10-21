import 'dart:io';

void main() {
  double? reais;
  
  while (reais == null) {
    stdout.write('Digite o valor em reais (R\$): ');
    String? entrada = stdin.readLineSync();

    if (entrada == null || entrada.isEmpty) {
      print('Entrada inválida! Tente novamente.');
      continue;
    }

    reais = double.tryParse(entrada);
    if (reais == null) {
      print('Valor inválido! Tente novamente.');
    }
  }

  double dolar = reais / 5.60;
  double euro = reais / 6;
  double won = reais * 230;

  print('\nDólares: \$${dolar.toStringAsFixed(2)}');
  print('Euros: €${euro.toStringAsFixed(2)}');
  print('Wons: ₩${won.toStringAsFixed(2)}\n');
}