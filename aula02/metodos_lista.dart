//Métodos para utilizar com listas

void main() {
  print('-' * 70);
  print('LISTA DE MÉTODOS PARA LISTAS');
  print('=' * 70);

  // add: adiciona um elemento ao final da lista.
  List<int> listaInteiros = [1, 2, 3];
  print('Lista original: $listaInteiros');
  listaInteiros.add(4);
  print('Lista nova: $listaInteiros');
  print('-' * 70);

  // addAll: adiciona vários elementos ao final da lista.
  List<String> listaFrutas = ['banana', 'maçã', 'pêra'];
  print('Lista original: $listaFrutas');
  listaFrutas.addAll(['Uva', 'goiaba', 'manga']);
  print('Lista nova: $listaFrutas');
  print('-' * 70);

  // remove: remove um elemento específico da lista.
  List<String> listaNomes = ['João', 'Maria', 'José'];
  print('Lista original: $listaNomes');
  listaNomes.remove('João');
  print('Lista nova: $listaNomes');
  print('-' * 70);

  // removeAt: remove um elemento pelo índice.
  List<double> listaDouble = [1.1, 2.2, 3.3];
  print('Lista original: $listaDouble');
  listaDouble.removeAt(1);
  print('Lista nova: $listaDouble');
  print('-' * 70);

  // insert: insere um elemento em um índice específico.
  List<String> listaArtistas = ['Fernanda Torres', 'Paulo José', 'Raul Cortez'];
  print('Lista original: $listaArtistas');
  listaArtistas.insert(2, 'Grande Otelo');
  print('Lista nova: $listaArtistas');
  print('-' * 70);

  // insertAll: insere vários elementos em um índice específico
  List<int> listaNumeros = [3, 4, 5];
  print('Lista original: $listaNumeros');
  listaNumeros.insertAll(0, [1, 2]);
  print('Lista nova: $listaNumeros');
  print('-' * 70);

  // indexOf: retorna o índice do primeiro elemento encontrado na lista.
  List<String> listaVogais = ['a', 'e', 'i', 'o', 'u', 'a', 'e', 'i', 'o', 'u'];
  print(listaVogais);
  print('A 1ª ocorrência da vogal i: índice ${listaVogais.indexOf('i')}');
  print('-' * 70);

  // lastIndexOf: retorna o índice do último elemento encontrado na lista.
  List<String> listaCarros = ['Fusca', 'Gol', 'Ferrari', 'Gol'];
  print(listaCarros);
  print('A última ocorrência do Gol: índice ${listaCarros.lastIndexOf('Gol')}');
  print('-' * 70);

  // sublist: retorna uma sublista a partir de um índice
  // inicial e um final (opcional). Final -1.
  List<int> lista = [1, 2, 3, 4, 5];
  print('Lista original: $lista');
  print('Sublista gerada: ${lista.sublist(1, 3)}');
  print('-' * 70);

  // sort: ordena os elementos da lista.
  List<String> listaVogais2 = ['u', 'a', 'o', 'i', 'e'];
  print('Lista original: $listaVogais2');
  listaVogais2.sort();
  print('Lista ordenada: $listaVogais2');

  // reversed: retorna uma nova lista com os elementos em ordem reversa.
  List<int> listaNumeros2 = [1, 2, 3, 4, 5, 6];
  print('Lista original: $listaNumeros2');
  var listaReversa = listaNumeros2.reversed.toList();
  print('Lista reversa: $listaReversa');
  print('-' * 70);

  // shuffle: embaralha os elementos da lista.
  List<String> listaVerduras = ['Couve' , 'Serraia', 'Alface', 'Rúcula'];
  print('Lista original: $listaVerduras');
  listaVerduras.shuffle();
  print('Lista embaralhada: $listaVerduras');
  print('-' * 70);
}