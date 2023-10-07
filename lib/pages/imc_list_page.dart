import 'package:flutter/material.dart';
import 'package:imcflutter/model/pessoa.dart';
import 'package:imcflutter/repository/pessoa_repository.dart';
import 'calcular_imc_page.dart'; // Importe a classe Pessoa do arquivo pessoa.dart

class ImcListPage extends StatefulWidget {
  const ImcListPage({Key? key}) : super(key: key);

  @override
  State<ImcListPage> createState() => _ImcListPageState();
}

class _ImcListPageState extends State<ImcListPage> {
  var pessoaRepository = PessoaRepository();
  var _pessoas = const <Pessoa>[];

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() {
    _pessoas = pessoaRepository.listar();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora IMC"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 5),
                      Text("Calcular Novo IMC"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CalcularImcPage()));
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: _pessoas.length,
          itemBuilder: (BuildContext bc, int index) {
            var pessoa = _pessoas[index];
            return Text(pessoa.getNome());
          }),
    );
  }
}
