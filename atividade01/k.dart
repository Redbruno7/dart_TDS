import 'dart:io';
import 'dart:math';

void main() {
  // Quadrado
  double? lado_quadrado;

  while (lado_quadrado == null) {
    stdout.write('Lado do quadrado: ');
    String? entrada_lado = stdin.readLineSync();

    if (entrada_lado == null || entrada_lado.isEmpty) {
      print('Entrada inválida! Tente novamente.');
      continue;
    }

    lado_quadrado = double.tryParse(entrada_lado);
    if (lado_quadrado == null) {
      print('Valor inválido! Tente novamente.');
    }
  }

  double area_quadrado = lado_quadrado * lado_quadrado;
  print('\nÁrea do quadrado: ${area_quadrado.toStringAsFixed(2)}\n');

  // Retângulo
  double? base_retangulo;
  double? altura_retangulo;

  while (base_retangulo == null) {
    stdout.write('Lado do retângulo: ');
    String? entrada_lado = stdin.readLineSync();

    if (entrada_lado == null || entrada_lado.isEmpty) {
      print('Entrada inválida! Tente novamente.');
      continue;
    }

    base_retangulo = double.tryParse(entrada_lado);
    if (base_retangulo == null) {
      print('Valor inválido! Tente novamente.');
    }
  }

  while (altura_retangulo == null) {
    stdout.write('Altura do retângulo: ');
    String? entrada_altura = stdin.readLineSync();

    if (entrada_altura == null || entrada_altura.isEmpty) {
      print('Entrada inválida! Tente novamente.');
      continue;
    }

    altura_retangulo = double.tryParse(entrada_altura);
    if (altura_retangulo == null) {
      print('Valor inválido! Tente novamente.');
    }
  }

  double area_retangulo = base_retangulo * altura_retangulo;
  print('\nÁrea do retângulo: ${area_retangulo.toStringAsFixed(2)}\n');

  // Triângulo
  double? base_triangulo;
  double? altura_triangulo;

  while (base_triangulo == null) {
    stdout.write('Base do triângulo: ');
    String? entrada_base = stdin.readLineSync();

    if (entrada_base == null || entrada_base.isEmpty) {
      print('Entrada inválida! Tente novamente.');
      continue;
    }

    base_triangulo = double.tryParse(entrada_base);
    if (base_triangulo == null) {
      print('Valor inválido! Tente novamente.');
    }
  }

  while (altura_triangulo == null) {
    stdout.write('Altura do triângulo: ');
    String? entrada_altura = stdin.readLineSync();

    if (entrada_altura == null || entrada_altura.isEmpty) {
      print('Entrada inválida! Tente novamente.');
      continue;
    }

    altura_triangulo = double.tryParse(entrada_altura);
    if (altura_triangulo == null) {
      print('Valor inválido! Tente novamente.');
    }
  }

  double area_triangulo = (base_triangulo * altura_triangulo) / 2;
  print('\nÁrea do triângulo: ${area_triangulo.toStringAsFixed(2)}\n');

  // Círculo
  double? raio;

  while (raio == null) {
    stdout.write('Raio do círculo: ');
    String? entrada_raio = stdin.readLineSync();

    if (entrada_raio == null || entrada_raio.isEmpty) {
      print('Entrada inválida! Tente novamente.');
      continue;
    }

    raio = double.tryParse(entrada_raio);
    if (raio == null) {
      print('Valor inválido! Tente novamente.');
    }
  }

  double area_circulo = pi * pow(raio, 2);
  print('\nÁrea do círculo: ${area_circulo.toStringAsFixed(2)}\n');
}