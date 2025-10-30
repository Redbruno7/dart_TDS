// Dada uma lista de strings que supostamente são endereços de email,
// filtre e colete em uma nova lista apenas os emails que contêm exatamente um caractere '@'
// e terminam com ".com".

import 'dart:io';

void main() {
  while (true) {
    List<String> lista_emails = [];

    // Validar quantidade de e-mails
    int? qtd;
    while (qtd == null) {
      stdout.write('\nQuantos e-mails deseja inserir na lista? ');
      String? entradaQtd = stdin.readLineSync();

      if (entradaQtd == null || entradaQtd.isEmpty) {
        print('Entrada inválida! Digite um número maior que 0.');
        continue;
      }

      qtd = int.tryParse(entradaQtd);
      if (qtd == null || qtd <= 0) {
        print('Quantidade inválida! Digite um número maior que 0.');
        qtd = null;
      }
    }

    // Validar e-mail
    for (int i = 0; i < qtd; i++) {
      String? email;
      while (email == null) {
        stdout.write('${i + 1}ª Palavra: ');
        String? entradaEmail = stdin.readLineSync();

        if (entradaEmail == null || entradaEmail.trim().isEmpty) {
          print('Entrada inválida! Digite um e-mail válido.');
          continue;
        }

        email = entradaEmail.trim();
      }

      lista_emails.add(email);
    }

    // Processamento
    List<String> emails_validos = [];

    for (var email in lista_emails) {
      int contador_arroba = '@'.allMatches(email).length;

      if (contador_arroba == 1 &&
          email.contains('@') &&
          !email.startsWith('@') &&
          !email.endsWith('@') &&
          email.toLowerCase().endsWith('.com')) {
        emails_validos.add(email);
      }
    }

    print('\nLista original: $lista_emails');

    if (emails_validos.isEmpty) {
      print('Nenhum e-mail válido encontrado.');
    } else {
      print('Emails válidos (um "@" e terminam com ".com"): $emails_validos');
    }

    // Reiniciar sistema
    while (true) {
      stdout.write('\nDeseja repetir? (s/n): ');
      String? resposta = stdin.readLineSync();

      if (resposta == null) continue;

      resposta = resposta.toLowerCase();
      if (resposta == 's') {
        print('-' * 80);
        break;
      } else if (resposta == 'n') {
        print('\nSistema encerrado.\n');
        return;
      } else {
        print('Resposta inválida.');
      }
    }
  }
}
