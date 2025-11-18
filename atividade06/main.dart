import 'dart:io';
import 'dart:math';

// ==================
// VARIÁVEIS GLOBAIS
// ==================
List<String> jogos = [];
Map<String, String> generos = {};
Map<String, List<double>> avaliacoes = {};

void main() {
  while (true) {
    clear();

    print('=' * 70);
    print('MENU PRINCIPAL');
    print('=' * 70);
    print('1 - Cadastro de Jogos');
    print('2 - Avaliar Jogos');
    print('3 - Filtrar por Gênero');
    print('4 - Sorteio de Jogo');
    print('0 - Sair');
    print('-' * 70);
    stdout.write('Escolha uma opção (0-4): ');
    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        programaCadastro();
        break;
      case '2':
        programaAvaliar();
        break;
      case '3':
        programaFiltro();
        break;
      case '4':
        programaSorteio();
        break;
      case '0':
        print('\nSistema encerrado! Obrigado por utilizar!\n');
        return;
      default:
        print('Opção inválida');
        stdout.write('\nPressione ENTER para voltar ao menu...');
        stdin.readLineSync();
    }
  }
}

// ======================
// 1 - CADASTRO DE JOGOS
// ======================
void programaCadastro() {
  void adicionarJogo() {
    stdout.write('\nNome do jogo: ');
    String? nome = stdin.readLineSync();

    if (nome == null || nome.isEmpty) {
      print('Nome inválido!');
      return;
    }

    nome = formatarTitulo(nome);

    stdout.write('Gênero do jogo: ');
    String? genero = stdin.readLineSync();

    if (genero == null || genero.isEmpty) {
      print('Gênero inválido!');
      return;
    }

    genero = formatarTitulo(genero);

    jogos.add(nome);
    generos[nome] = genero;

    print('"$nome" adicionado com sucesso!');
  }

  String listarJogos() {
    if (jogos.isEmpty) return '\nNenhum jogo cadastrado ainda.';

    var ordem = List.from(jogos)..sort();
    return '\nJogos cadastrados:\n' +
        ordem.map((j) => '- $j (${generos[j]})').join('\n');
  }

  void mostrarMenu() {
    clear();
    print('=' * 70);
    print('CADASTRO DE JOGOS');
    print('=' * 70);
  }

  while (true) {
    mostrarMenu();
    print('1 - Adicionar jogo');
    print('2 - Listar jogos');
    print('0 - Voltar');
    print('-' * 70);
    stdout.write('Escolha uma opção (0-2): ');
    String? escolha = stdin.readLineSync();

    if (escolha == '1') {
      adicionarJogo();
    } else if (escolha == '2') {
      print(listarJogos());
    } else if (escolha == '0') {
      break;
    } else {
      print('Opção inválida!');
    }

    stdout.write('\nPressione ENTER para voltar ao menu...');
    stdin.readLineSync();
  }
}

// ==================
// 2 - AVALIAR JOGOS
// ==================
void programaAvaliar() {
  void adicionarNota() {
    stdout.write('\nNome do jogo: ');
    String? jogo = stdin.readLineSync();

    if (jogo == null || jogo.trim().isEmpty) {
      print('Nome inválido!');
      return;
    }

    jogo = formatarTitulo(jogo);

    if (!jogos.contains(jogo)) {
      print('Jogo não encontrado!');
      return;
    }

    stdout.write('Nota (0-10): ');
    double? nota = double.tryParse(stdin.readLineSync() ?? '');

    if (nota == null || nota < 0 || nota > 10) {
      print('Nota inválida!');
      return;
    }

    avaliacoes.putIfAbsent(jogo, () => []);
    avaliacoes[jogo]!.add(nota);

    print('Nota registrada para "$jogo"!');
  }

  double calcularMedia(String jogo) {
    var notas = avaliacoes[jogo];
    if (notas == null || notas.isEmpty) return 0.0;
    return notas.reduce((a, b) => a + b) / notas.length;
  }

  void mostrarMedia() {
    if (avaliacoes.isEmpty) {
      print('\nNenhum jogo avaliado ainda.');
      return;
    }

    var ranking = avaliacoes.keys.toList()
      ..sort((a, b) => calcularMedia(b).compareTo(calcularMedia(a)));

    print('\nRanking de médias (maior - menor):');
    for (var jogo in ranking) {
      print('- $jogo - Média: ${calcularMedia(jogo).toStringAsFixed(2)}');
    }
  }

  while (true) {
    clear();
    print('=' * 70);
    print('AVALIAÇÃO');
    print('=' * 70);
    print('1 - Adicionar nota');
    print('2 - Ver médias');
    print('0 - Voltar');
    print('-' * 70);
    stdout.write('Escolha uma opção (0-2): ');
    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        adicionarNota();
        break;
      case '2':
        mostrarMedia();
        break;
      case '0':
        return;
      default:
        print('Opção inválida');
    }

    stdout.write('\nPressione ENTER para voltar...');
    stdin.readLineSync();
  }
}

// =======================
// 3 - FILTRAR POR GÊNERO
// =======================
void programaFiltro() {
  void filtrarGenero() {
    if (jogos.isEmpty) {
      print('\nNenhum jogo cadastrado.');
      return;
    }

    stdout.write('\nGênero desejado: ');
    String? genero = stdin.readLineSync();

    if (genero == null || genero.isEmpty) {
      print('Gênero inválido!');
      return;
    }

    genero = formatarTitulo(genero);

    var filtrados = jogos.where((j) => generos[j] == genero).toList();

    if (filtrados.isEmpty) {
      print('\nNenhum jogo encontrado para esse gênero.');
      return;
    }

    print('\nJogos encontrados:');
    filtrados.forEach((j) => print('- $j'));
  }

  while (true) {
    clear();
    print('=' * 70);
    print('FILTRAR POR GÊNERO');
    print('=' * 70);
    print('1 - Buscar');
    print('0 - Voltar');
    print('-' * 70);
    stdout.write('Escolha uma opção (0-1): ');
    String? escolha = stdin.readLineSync();

    if (escolha == '1') {
      filtrarGenero();
    } else if (escolha == '0') {
      return;
    } else {
      print('Opção inválida!');
    }

    stdout.write('\nPressione ENTER para continuar...');
    stdin.readLineSync();
  }
}

// ============
// 4 - SORTEIO
// ============
void programaSorteio() {
  if (jogos.isEmpty) {
    print('\nNenhum jogo cadastrado.');
    stdout.write('\nPressione ENTER...');
    stdin.readLineSync();
    return;
  }

  clear();
  print('=' * 70);
  print('SORTEIO DE JOGO');
  print('=' * 70);

  var random = Random();
  String sorteado = jogos[random.nextInt(jogos.length)];

  print('\nJogo sorteado: $sorteado');

  stdout.write('\nPressione ENTER para voltar...');
  stdin.readLineSync();
}

// ===========================
// FORMATAR TÍTULOS DOS JOGOS
// ===========================
String formatarTitulo(String texto) {
  if (texto.trim().isEmpty) return texto;

  return texto
      .trim()
      .split(' ')
      .map((palavra) {
        if (palavra.isEmpty) return palavra;
        return palavra[0].toUpperCase() + palavra.substring(1).toLowerCase();
      })
      .join(' ');
}

// ============
// LIMPAR TELA
// ============
void clear() {
  print("\x1B[2J\x1B[0;0H");
}
