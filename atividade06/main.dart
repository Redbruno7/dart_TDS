import 'dart:io';
import 'dart:math';

// =================
// VARIÁVEIS GLOBAIS
// =================
List<String> jogos = [];
Map<String, String> generos = {};
Map<String, List<double>> avaliacoes = {};

// ===========
// FUNÇÃO MAIN
// ===========
void main() {
  while (true) {
    String opcao = menuGenerico('Menu Principal', [
      'Cadastro de Jogos',
      'Avaliar Jogos',
      'Filtrar por Gênero',
      'Sorteio de Jogo',
    ]);

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
        erro('Opção inválida!');
    }
  }
}

// ========================
// FUNÇÕES UTILITÁRIAS BASE
// ========================

// Ler entrada
String lerEntrada(String msg) {
  stdout.write('$msg ');
  return stdin.readLineSync()?.trim() ?? '';
}

// Validar entrada
String lerNaoVazio(String msg) {
  while (true) {
    String valor = lerEntrada(msg);
    if (valor.isNotEmpty) return valor;
    erro('Entrada inválida!');
  }
}

// Mensagem de erro genérica
void erro(String msg) {
  print(msg);
  esperar();
}

// Pausa estratégica
void esperar() {
  stdout.write('\nPressione ENTER para continuar...');
  stdin.readLineSync();
}

// Formatar Título
String titulo(String texto) {
  return texto
      .trim()
      .split(' ')
      .map(
        (p) =>
            p.isEmpty ? p : p[0].toUpperCase() + p.substring(1).toLowerCase(),
      )
      .join(' ');
}

// Menu genérico
String menuGenerico(String nome, List<String> opcoes) {
  clear();
  print('=' * 70);
  print(nome.toUpperCase());
  print('=' * 70);

  for (int i = 0; i < opcoes.length; i++) {
    print('${i + 1} - ${opcoes[i]}');
  }

  print('0 - Voltar');
  print('-' * 70);

  return lerEntrada('Escolha uma opção (0-${opcoes.length}):');
}

// =====================
// 1 - CADASTRO DE JOGOS
// =====================
void programaCadastro() {
  while (true) {
    String escolha = menuGenerico('Cadastro de Jogos', [
      'Adicionar jogo',
      'Listar jogos',
    ]);

    switch (escolha) {
      case '1':
        adicionarJogo();
        break;
      case '2':
        listarJogos();
        break;
      case '0':
        return;
      default:
        erro('Opção inválida!');
    }

    esperar();
  }
}

void adicionarJogo() {
  String nome = titulo(lerNaoVazio('Nome do jogo:'));
  String genero = titulo(lerNaoVazio('Gênero do jogo:'));

  jogos.add(nome);
  generos[nome] = genero;

  print('\n"$nome" adicionado com sucesso!');
}

void listarJogos() {
  if (jogos.isEmpty) {
    print('\nNenhum jogo cadastrado ainda.');
    return;
  }

  print('\nJogos cadastrados:\n');
  for (var j in List.from(jogos)..sort()) {
    print('- $j (${generos[j]})');
  }
}

// =================
// 2 - AVALIAR JOGOS
// =================
void programaAvaliar() {
  while (true) {
    String opcao = menuGenerico('Avaliação de Jogos', [
      'Adicionar nota',
      'Ver médias',
    ]);

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
        erro('Opção inválida!');
    }

    esperar();
  }
}

void adicionarNota() {
  String jogo = titulo(lerNaoVazio('\nNome do jogo:'));

  if (!jogos.contains(jogo)) {
    print('Jogo não encontrado!');
    return;
  }

  double? nota;

  while (nota == null || nota < 0 || nota > 10) {
    nota = double.tryParse(lerEntrada('Nota (0-10):'));
    if (nota == null || nota < 0 || nota > 10) {
      print('Nota inválida!');
    }
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

  print('\nRanking de médias:\n');
  for (var jogo in ranking) {
    print('- $jogo - Média: ${calcularMedia(jogo).toStringAsFixed(2)}');
  }
}

// ======================
// 3 - FILTRAR POR GÊNERO
// ======================
void programaFiltro() {
  while (true) {
    String escolha = menuGenerico('Filtro por Gênero', ['Buscar']);

    switch (escolha) {
      case '1':
        filtrarGenero();
        break;
      case '0':
        return;
      default:
        erro('Opção inválida!');
    }

    esperar();
  }
}

void filtrarGenero() {
  if (jogos.isEmpty) {
    print('\nNenhum jogo cadastrado.');
    return;
  }

  String genero = titulo(lerNaoVazio('Gênero desejado:'));

  var filtrados = jogos.where((j) => generos[j] == genero).toList();

  if (filtrados.isEmpty) {
    print('\nNenhum jogo encontrado para esse gênero.');
    return;
  }

  print('\nJogos encontrados:\n');
  filtrados.forEach((j) => print('- $j'));
}

// ===========
// 4 - SORTEIO
// ===========
void programaSorteio() {
  if (jogos.isEmpty) {
    print('\nNenhum jogo cadastrado.');
    esperar();
    return;
  }

  String opcao = menuGenerico('Sorteio de Jogo', ['Sortear Agora']);

  if (opcao == '1') {
    String sorteado = jogos[Random().nextInt(jogos.length)];
    print('\nJogo sorteado: $sorteado');
  }

  esperar();
}

// ===========
// LIMPAR TELA
// ===========
void clear() {
  print("\x1B[2J\x1B[0;0H");
}
