import 'dart:io';
void main() {
  stdout.write('Entre com seu nome: ');
  // stdin.readLineSync() retorna String? -> pode ser null se o usuário não digitar nada
  // Por isso a variável precisa ser do tipo String? para permitir null
  String? nome = stdin.readLineSync();

  // Null Safety:
  // - Se nome for null ou vazio, usamos valor padrão 'Não informado'
  // - O operador ?? poderia ser usado diretamente, mas aqui adicionamos
  //   isEmpty para garantir que string vazia também seja tratada
  nome = (nome == null || nome.isEmpty) ? 'Não informado' : nome;

  // OU de forma mais curta:
  nome = (nome ?? '').isEmpty ? 'Não informado' : nome;

  stdout.write('Data de Nascimento: ');

  // Lemos a entrada como String? (pode ser null)
  String? inputIdade = stdin.readLineSync();

  // Null Safety:
  // - Verificamos se a entrada não é null e não está vazia
  // - int.tryParse() retorna int? (pode ser null se não for número válido)
  int? idade = (inputIdade != null && inputIdade.isNotEmpty)
      ? int.tryParse(inputIdade)
      : null;

  // Se idade for null, significa que a conversão falhou -> mensagem de erro
  if (idade == null) {
    print('Idade inválida! Digite um número válido.');
    return; // encerra o programa
  }

  // nome já foi tratado: nunca será null aqui
  // idade também é int não-nulo neste ponto
  print('Seu nome é $nome');
  print('Nascimento $idade');
}