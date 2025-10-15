import 'dart:io';

void main(List<String> args) {
  stdout.write('Digite seu peso (kg): ');
  double peso = double.parse(stdin.readLineSync()!);

  stdout.write('Digite sua altura (m): ');
  double altura = double.parse(stdin.readLineSync()!);

  double imc = peso / (altura * altura);
  print('Seu IMC é ${imc.toStringAsFixed(2)}');

  if (imc < 18.5) {
    print('Abaixo do peso.');
  } else if (imc < 25) {
    print('Peso normal.');
  } else if (imc < 30) {
    print('Sobrepeso:.');
  } else {
    print('Obesidade.');
  }
}