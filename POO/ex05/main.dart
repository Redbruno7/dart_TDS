import 'dart:io';

class Triangulo {
  // Atributos
  double base;
  double altura;

  // Construtor com parâmetros nomeados
  Triangulo({required this.base, required this.altura});

  // Método para calcular a área
  double calcularArea() {
    return (base * altura) / 2;
  }
}

// Run | Debug
void main() {
  print('');
  stdout.write("Base do triângulo: ");
  double base = double.parse(stdin.readLineSync()!);

  stdout.write("Altura do triângulo: ");
  double altura = double.parse(stdin.readLineSync()!);

  // Instanciando objeto com parâmetros NOMEADOS
  Triangulo triangulo = Triangulo(base: base, altura: altura);

  double area = triangulo.calcularArea();

  print("A área do triângulo é: $area");
  print('-' * 70);
}
