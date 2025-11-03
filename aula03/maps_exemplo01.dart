void main() {
  // Map de agenda: cada chave é o nome da pessoa
  // e cada valor é outro Map cpm informações detalhadas (idade e email)
  Map<String, dynamic> agenda = {
    'John': {'idade': 50, 'email': 'john@gmail.com'},
    'Jane': {'idade': 40, 'email': 'jane@gmail.com'},
  };

  // Map de cadastro pessoa: chave -> valor com tipos variados (int, double, String)
  // dynamic permite que cada valor seja de tipo diferente
  Map<String, dynamic> cadastro = {
    'nome': 'John Doe',
    'nascimento': 1970,
    'altura': 1.80,
    'est_civil': 'solteiro',
    'cidade': 'Juiz de Fora',
    'uf': 'MG',
  };

  // Saída formatada
  print('-' * 70);
  print('Minha agenda');
  print(agenda);
  print('-' * 70);

  print('-' * 70);
  print('Meu cadastro');
  print(cadastro);
  print('-' * 70);
}
