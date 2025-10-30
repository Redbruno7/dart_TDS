// Dada uma lista de strings que supostamente são endereços de email,
// filtre e colete em uma nova lista apenas os emails que contêm exatamente um caractere '@'
// e terminam com ".com".

import 'dart:io';

void main() {
  while (true) {
    List<String> lista_emails = [];

    // Ler emails da lista
    stdout.write('\nDigite uma lista de emails separados por espaço: ');
    String entradaEmails = (stdin.readLineSync() ?? '').trim();

    if (entradaEmails.isEmpty) {
      print('Nenhum email informado.');
    } else {
      List<String> partes = entradaEmails.split(' ');

      for (var email in partes) {
        email = email.trim();
        if (email.isEmpty) continue;
        lista_emails.add(email);
      }

      // Processamento
      if (lista_emails.isEmpty) {
        print('Nenhum email válido informado.');
      } else {
        List<String> emails_validos = [];

        for (var email in lista_emails) {
          int countAt = '@'.allMatches(email).length;
          if (countAt == 1 && email.endsWith('.com')) {
            emails_validos.add(email);
          }
        }

        print('\nLista original: $lista_emails');
        print('Emails válidos (um "@" e terminam com ".com"): $emails_validos');
      }
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
