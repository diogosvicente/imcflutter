import 'package:flutter/material.dart';
import 'package:imcflutter/repository/pessoa_repository.dart';

import '../model/pessoa.dart';

class CalcularImcPage extends StatefulWidget {
  const CalcularImcPage({super.key});

  @override
  State<CalcularImcPage> createState() => _CalcularImcPageState();
}

class _CalcularImcPageState extends State<CalcularImcPage> {
  var nomeController = TextEditingController();
  var pesoController = TextEditingController();
  var alturaController = TextEditingController();
  double pesoDouble = 0.0;
  double alturaDouble = 0.0;
  List<Pessoa> pessoas = [];
  var pessoaRepository = PessoaRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Informe os dados"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: ListView(
            children: [
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: pesoController,
                decoration: const InputDecoration(labelText: 'Peso (kg)'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: alturaController,
                decoration: const InputDecoration(labelText: 'Altura (m)'),
                keyboardType: TextInputType.number,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {});
                    if (nomeController.text.trim() == "") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Nome deve ser preenchido")));
                      return;
                    }
                    if (pesoController.text.trim() == "") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Peso deve ser preenchido")));
                      return;
                    }
                    if (alturaController.text.trim() == "") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Altura deve ser preenchida")));
                      return;
                    }

                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Dados salvos com sucesso!")));
                      //salvando = true;
                    });
                    try {
                      pesoDouble = double.parse(pesoController.text);
                    } catch (e) {
                      debugPrint('Erro ao converter para double: $e');
                    }
                    try {
                      alturaDouble = double.parse(alturaController.text);
                    } catch (e) {
                      debugPrint('Erro ao converter para double: $e');
                    }
                    pessoaRepository.adicionar(
                        Pessoa(nomeController.text, pesoDouble, alturaDouble));
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: const Text("Salvar"))
            ],
          ),
        ));
  }
}

/*class ListaPessoasWidget extends StatelessWidget {
  final List<Pessoa> pessoas;

  ListaPessoasWidget({required this.pessoas});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pessoas.length,
      itemBuilder: (context, index) {
        Pessoa pessoa = pessoas[index];
        return ListTile(
          title: Text('Nome: ${pessoa.getNome()}'),
          subtitle:
              Text('Peso: ${pessoa.getPeso()} kg | Altura: ${pessoa.getAltura()} m'),
          trailing: Text('IMC: ${pessoa.calcularImc().toStringAsFixed(2)}'),
        );
      },
    );
  }
}*/