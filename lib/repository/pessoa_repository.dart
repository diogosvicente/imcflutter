import 'package:imcflutter/model/pessoa.dart';

class PessoaRepository {
  final List<Pessoa> _pessoas = [];

  void adicionar(Pessoa pessoa) {
    _pessoas.add(pessoa);
  }

  void remover(String id) {
    _pessoas.remove(_pessoas.where((pessoa) => pessoa.id == id).first);
  }

  List<Pessoa> listar() {
    return _pessoas;
  }
}
