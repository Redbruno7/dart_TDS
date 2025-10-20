import 'dart:io';

void main() {
  stdout.write('Digite seu peso (kg): ');
  String? pesoStr = stdin.readLineSync();

  stdout.write('Digite sua altura (m): ');
  String? alturaStr = stdin.readLineSync();

  if (pesoStr == null ||
      alturaStr == null ||
      pesoStr.isEmpty ||
      alturaStr.isEmpty) {
    print('ERRO: valor inválido!');
    return;
  }

  double peso = double.tryParse(pesoStr) ?? 0;
  double altura = double.tryParse(alturaStr) ?? 0;

  if (peso <= 0 || altura <= 0) {
    print('ERRO: peso e altura devem ser maiores que zero!');
    return;
  }

  double imc = peso / (altura * altura);
  print('Seu IMC é ${imc.toStringAsFixed(2)}');

  if (imc < 18.5) {
    print('Abaixo do peso.');
  } else if (imc < 25) {
    print('Peso normal.');
  } else if (imc < 30) {
    print('Sobrepeso.');
  } else {
    print('Obesidade.');
  }
}