import 'dart:io';
import 'dart:math';

// =================
// VARIÁVEIS GLOBAIS
// =================
List<String> jogos = [];
Map<String, String> generos = {};
Map<String, List<double>> avaliacoes = {};

// ================
// FUNÇÕES EXIGIDAS
// ================

// ============
// 1 — CADASTRO
// ============

// Função void
void mostrarQuantidadeJogos() {
  print("\nTotal de jogos cadastrados: ${jogos.length}");
}

// Função com retorno
int contarPorGenero(String genero) {
  return jogos.where((j) => generos[j] == genero).length;
}

// Função com parâmetro opcional
void adicionarJogoOpcional(String nome, [String genero = "Desconhecido"]) {
  jogos.add(nome);
  generos[nome] = genero;
}

// Função anônima
var funcaoAnonimaCadastro = (String jogo) => print("- $jogo");

// =============
// 2 — AVALIAÇÃO
// =============

// Função void
void mostrarTotalAvaliacoes() {
  print("\nTotal de jogos avaliados: ${avaliacoes.length}");
}

// Função com retorno
double maiorMedia() {
  if (avaliacoes.isEmpty) return 0.0;
  return avaliacoes.values
      .map((l) => l.reduce((a, b) => a + b) / l.length)
      .reduce(max);
}

// Função com parâmetro opcional
void adicionarNotaOpcional(String jogo, [double nota = 5.0]) {
  avaliacoes.putIfAbsent(jogo, () => []);
  avaliacoes[jogo]!.add(nota);
}

// Função anônima
var funcaoAnonimaAvaliacao = (String jogo, double media) =>
    print("- $jogo (média $media)");

// ==========
// 3 — FILTRO
// ==========

// Função void
void mostrarGenerosExistentes() {
  print("\nGêneros cadastrados:");
  generos.values.toSet().forEach((g) => print("- $g"));
}

// Função com retorno
List<String> retornarFiltrados(String genero) {
  return jogos.where((j) => generos[j] == genero).toList();
}

// Função com parâmetro opcional
List<String> filtrarOpcional([String genero = "Aventura"]) {
  return retornarFiltrados(genero);
}

// Função anônima
var funcaoAnonimaFiltro = (String nome) => print("- $nome");

// ===========
// 4 — SORTEIO
// ===========

// Função void
void mostrarUltimoSorteado(String nome) {
  print("\nÚltimo sorteado: $nome");
}

// Função com retorno
String sortear() {
  return jogos[Random().nextInt(jogos.length)];
}

// Função com parâmetro opcional
List<String> sortearVarios([int qtd = 1]) {
  List<String> lista = [];
  for (int i = 0; i < qtd; i++) lista.add(sortear());
  return lista;
}

// Função anônima
var funcaoAnonimaSorteio = (String nome) => print("- $nome");

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

    esperar();
  }
}

// ========================
// FUNÇÕES UTILITÁRIAS BASE
// ========================

String lerEntrada(String msg) {
  stdout.write('$msg ');
  return stdin.readLineSync()?.trim() ?? '';
}

String lerNaoVazio(String msg) {
  while (true) {
    String valor = lerEntrada(msg);
    if (valor.isNotEmpty) return valor;
    erro('Entrada inválida!');
  }
}

void erro(String msg) {
  print(msg);
}

void esperar() {
  stdout.write('\nPressione ENTER para continuar...');
  stdin.readLineSync();
}

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
      'Quantidade por gênero',
    ]);

    switch (escolha) {
      case '1':
        adicionarJogo();
        break;
      case '2':
        listarJogos();
        break;
      case '3':
        String gen = titulo(lerNaoVazio("Gênero:"));
        print("\nTotal: ${contarPorGenero(gen)}");
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

  print('\nJogos cadastrados (ordenados por gênero):\n');

  var listaOrdenada = List<String>.from(jogos)
    ..sort((a, b) => generos[a]!.compareTo(generos[b]!));

  for (var jogo in listaOrdenada) {
    print("- $jogo (${generos[jogo]})");
  }

  mostrarQuantidadeJogos(); 
}


// =================
// 2 - AVALIAR JOGOS
// =================
void programaAvaliar() {
  while (true) {
    String opcao = menuGenerico('Avaliação de Jogos', [
      'Adicionar nota',
      'Ver médias',
      'Maior média geral', // usa função com retorno
    ]);

    switch (opcao) {
      case '1':
        adicionarNota();
        break;
      case '2':
        mostrarMedia();
        break;
      case '3':
        print("\nMaior média: ${maiorMedia().toStringAsFixed(2)}");
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

  print('\nRanking de médias:\n');
  var ranking = avaliacoes.keys.toList()
    ..sort((a, b) => calcularMedia(b).compareTo(calcularMedia(a)));

  ranking.forEach((jogo) => funcaoAnonimaAvaliacao(jogo, calcularMedia(jogo)));

  mostrarTotalAvaliacoes(); // void
}

// ======================
// 3 - FILTRAR POR GÊNERO
// ======================
void programaFiltro() {
  while (true) {
    String escolha = menuGenerico('Filtro por Gênero', [
      'Buscar',
      'Mostrar gêneros existentes',
      'Filtro padrão (parâmetro opcional)',
    ]);

    switch (escolha) {
      case '1':
        filtrarGenero();
        break;
      case '2':
        mostrarGenerosExistentes();
        break;
      case '3':
        var padrao = filtrarOpcional();
        print('\nJogos do gênero "aventura":\n');
        padrao.forEach(funcaoAnonimaFiltro);
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

  var filtrados = retornarFiltrados(genero);

  if (filtrados.isEmpty) {
    print('\nNenhum jogo encontrado para esse gênero.');
    return;
  }

  print('\nJogos encontrados:\n');
  filtrados.forEach(funcaoAnonimaFiltro);
}

// ===========
// 4 - SORTEIO
// ===========
void programaSorteio() {
  while (true) {
    if (jogos.isEmpty) {
      print('\nNenhum jogo cadastrado.');
      return;
    }

    String opcao = menuGenerico('Sorteio de Jogo', [
      'Sortear Agora',
      'Sortear múltiplos (opcional)',
    ]);

    if (opcao == '1') {
      String escolhido = sortear();
      print('\nJogo sorteado: $escolhido');
      mostrarUltimoSorteado(escolhido);
    }

    if (opcao == '2') {
      int qtd = int.tryParse(lerEntrada("Quantidade a sortear:")) ?? 1;
      var lista = sortearVarios(qtd);
      print("\nResultados:");
      lista.forEach(funcaoAnonimaSorteio);
    }

    if (opcao == '0') return;

    esperar();
  }
}

// ===========
// LIMPAR TELA
// ===========
void clear() {
  print("\x1B[2J\x1B[0;0H");
}
