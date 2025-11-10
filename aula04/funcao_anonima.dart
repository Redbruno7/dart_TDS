void main() {
  // ======================
  // Exemplo Básico
  // ======================
  print("=== Exemplo Básico ===");

  // Criamos uma função anônima e armazenamos em uma variável
  var saudacao = (String nome) {
    // Função anônima: recebe 'nome' e retorna uma saudação
    // sem precisar de nome de função
    return "Olá, $nome!";
  };

  // Chamada da função anônima
  print(saudacao("Maria")); // -> "Olá, Maria!"
  print(saudacao("João"));  // -> "Olá, João!"

  // saudacao ---> função anônima
  // "Maria" ----|
  // "João" ----> função é executada e retorna a string

  print(""); // Espaço

  // ======================
  // Exemplo Intermediário (IIFE)
  // IIFE é a sigla para Immediately Invoked Function Expression,
  // Expressão de Função Invocada Imediatamente.
  // ======================
  print("=== Exemplo Intermediário (IIFE) ===");

  // Função anônima executada imediatamente
  (() {
    int x = 5;
    int y = 10;
    print("A soma de $x e $y é ${x + y}");
  })(); // <-- os parênteses no final chamam a função imediatamente

  // (() { ... })() <-- função é criada e chamada imediatamente
  // [Bloco de código dentro da função é executado agora]

  print(""); // Espaço

  // ======================
  // Exemplo Avançado (Closures)
  // ======================
  print("=== Exemplo Avançado (Closures) ===");

  // Função que retorna uma função anônima
  Function multiplicador(int x) {
    // A função anônima "lembra" do valor de x mesmo após multiplicador terminar
    return (int y) => x * y;
  }

  // Criando funções específicas a partir da função multiplicador
  var dobra = multiplicador(2); // função que multiplica por 2
  var triplica = multiplicador(3); // função que multiplica por 3

  // Chamando as funções resultantes
  print(dobra(5));    // -> 10
  print(triplica(5)); // -> 15

  // Visualmente:
  // multiplicador(2) ---> retorna função anônima (y => 2 * y)
  // dobra(5) -----------? 2 * 5 = 10
  //
  // multiplicador(3) ---> retorna função anônima (y => 3 * y)
  // triplica(5) --------? 3 * 5 = 15

  print(""); // Espaço
}

