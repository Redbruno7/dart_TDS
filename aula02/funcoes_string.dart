void main() {
  // String base
  String frase = ' Gal Gadot! My true love!!';

  // ------------------------------------------
  // length → tamanho da string
  int tamanhoString = frase.length;

  // toUpperCase() → tudo maiúsculo
  String fraseMaiuscula = frase.toUpperCase();

  // toLowerCase() → tudo minúsculo
  String fraseMinuscula = frase.toLowerCase();

  // contains() → verifica se um trecho existe na string
  bool contemGal = frase.contains('Gal');
  bool contemBatman = frase.contains('Batman');

  // substring() → recorta parte da string (início, fim)
  String pedaco = frase.substring(0, 9); // do índice 0 até 8

  // replaceAll() → substitui todas as ocorrências
  String substituida = frase.replaceAll('love', 'paixão');

  // split() → divide a string em partes, gerando uma lista
  List<String> palavras = frase.split(' ');

  // trim() → remove espaços extras no início e no fim
  String comEspacos = '   Gal Gadot   ';
  String semEspacos = comEspacos.trim();

  // ------------------------------------------
  // Saída formatada
  print('-' * 70);
  print('Frase original: $frase');
  print('=' * 70);
  print('Tamanho da frase: $tamanhoString');
  print('Maiúscula: $fraseMaiuscula');
  print('Minúscula: $fraseMinuscula');
  print('-' * 70);
  print('Contém "Gal"? $contemGal');
  print('Contém "Batman"? $contemBatman');
  print('-' * 70);
  print('Substring (0 a 9): $pedaco');
  print('ReplaceAll: $substituida');
  print('-' * 70);
  print('Split em palavras: $palavras');
  print('Trim antes: "$comEspacos"');
  print('Trim depois: "$semEspacos"');
  print('-' * 70);
}
