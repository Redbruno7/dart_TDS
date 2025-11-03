void main() {
  print('-' * 70);
  print('EXEMPLO DE WHERE(), MAP() E REDUCE() NA FILTRAGEM');
  print('-' * 70);

  // Map de números: chave é uma String e valor é um int
  Map<String, int> numeros = {
    'um': 1,
    'dois': 2,
    'tres': 3,
    'quatro': 4,
    'cinco': 5,
  };

  // Encadeamento de métodos funcionais:
  int soma = numeros
      .values // Pegamos apenas os valores do Map [1,2,3,4,5]
      .where((num) => num % 2 == 0) // Filtra: mantém apenas os pares -> [2, 4]
      .map(
        (num) => num * 2,
      ) // Transforma: multiplica cada valor por 2 -> [4, 8]
      .reduce(
        (soma, num) => soma + num,
      ); // Reduz: soma todos os elementos -> 12

  // Saída
  print('Resultado final: $soma'); // 12
  print('-' * 70);
}
