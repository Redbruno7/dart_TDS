void main() {
  print('-' * 70);
  print('EXEMPLO DE USO DO WHERE()');
  print('-' * 70);

  // Declração da lista
  List<int> numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  // .toList(): transforma a busca em uma lista separada
  List<int> numerosPares = numeros.where((num) => num % 2 == 0).toList();

  // Saída
  print('-' * 70);
  print('Nova lista: ${numerosPares}'); // [2, 4, 6, 8, 10]
  print('-' * 70);
}