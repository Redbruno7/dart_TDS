void main() {
  // Criando um Map simples (estrutura chave -> valor)
  var meuMap = {'a': 1, 'b': 2, 'c': 3};

  print('-' * 70);
  print('VARREDURA COM O MÉTODO map()');
  print('-' * 70);

  /*
   * Atenção: não confundir o tipo Map<> com o método map()
   * - Map<> é um tipo de dado em Dart (estrutura de chave/valor).
   * - .map() é um método usado para transformar cada elemento de
   *   uma coleção (pode ser Lista, Map ou Set).
   *
   * Aqui usamos meuMap.entries para acessar cada par (chave, valor).
   * O método .map() transforma cada entrada em uma String no formato:
   * "chave valor"
   */

  var resultado = meuMap.entries.map(
    (entrada) => '${entrada.key}: ${entrada.value}',
  );

  // O resultado de .map() é um Iterable, por isso usamos .join()
  // para juntar em uma String só
  print(resultado.join(', ')); // Saída: a: 1, b: 2, c: 3
  print('-' * 70);

  /*
   * Outro exemplo: usando .map() em uma Lista
   * Aqui temos uma lista de números e queremos dobrar cada valor.
   *
   * O método .map() aplica a função (number * 2) em cada elemento,
   * gerando um novo Iterable com os valores transformados.
   */

  List<int> numeros = [1, 2, 3, 4, 5];
  var doubledNumbers = numeros.map((number) => number * 2);

  // Atenção: o retorno ainda é Iterable, não uma lista.
  print(doubledNumbers); // Saída: (2, 4, 6, 8, 10)
  print('-' * 70);
}
