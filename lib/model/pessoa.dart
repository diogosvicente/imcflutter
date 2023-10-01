class Pessoa {
  String _nome = "";
  double _peso = 0;
  double _altura = 0;
  double _imc = 0;
  String _classificacao = "";

  String get nome => _nome;
  double get peso => _peso;
  double get altura => _altura;
  double get imc => _imc;
  String get classificacao => _classificacao;

  set nome(String nome) {
    _nome = nome;
  }

  set peso(double peso) {
    _peso = peso;
  }

  set altura(double altura) {
    _altura = altura;
  }

  double calcularImc() => (_peso / (_altura * _altura));

  String classificarImc() {
    double imc = calcularImc();

    if (imc < 16.0) {
      return ("Magreza grave");
    } else if (imc < 17.0) {
      return ("Magreza moderada");
    } else if (imc < 18.5) {
      return ("Magreza leve");
    } else if (imc < 25.0) {
      return ("Saudável");
    } else if (imc < 30.0) {
      return ("Sobrepeso");
    } else if (imc < 35.0) {
      return ("Obesidade Grau I");
    } else if (imc < 40.0) {
      return ("Obesidade Grau II (severa)");
    } else {
      return ("Obesidade Grau III (mórbida)");
    }
  }

  set imc(double imc) {
    _imc = imc;
  }

  set classificacao(String classificacao) {
    _classificacao = classificacao;
  }
}
