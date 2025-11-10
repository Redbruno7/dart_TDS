void main() {
  // Declaração de variáveis
  int valor1 = 10;
  int valor2 = 20;

  // Chamando a função com os dois parâmetros
  int resultadoSoma = somaValores(valor1, valor2);
  print('O resultado da soma com dois parâmetros: $resultadoSoma\n');

  // Chamando a função apenas com o parâmetro obrigatório
  int resultadoSomaOpcional = somaValores(valor1);
  print('A soma com apenas um parâmetro: $resultadoSomaOpcional');
}

// Função com 1 parâmetro obrigatório e 1 opcional
// O parâmetro opcional é colocado entre colchetes [ ]
// e recebe um valor padrão (= 0) caso não seja informado
int somaValores(int valor1, [int valor2 = 0]) {
  print('Valor 1: $valor1');
  print('Valor 2: $valor2');

  // Retorna a soma dos dois valores
  return valor1 + valor2;
}
