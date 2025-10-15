import 'dart:io';

void main(List<String> args) {
  stdout.write('Digite o ano de nascimento: ');
  int ano = int.parse(stdin.readLineSync()!);

  int idade = DateTime.now().year - ano;
  print('Sua idade é $idade anos.');
}