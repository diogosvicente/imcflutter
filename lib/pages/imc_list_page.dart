import 'package:flutter/material.dart';
import 'package:imcflutter/model/pessoa.dart';

import 'calcular_imc_page.dart'; // Importe a classe Pessoa do arquivo pessoa.dart

class ImcListPage extends StatefulWidget {
  const ImcListPage({Key? key}) : super(key: key);

  @override
  State<ImcListPage> createState() => _ImcListPageState();
}

class _ImcListPageState extends State<ImcListPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  List<Pessoa> pessoas = [];

  void calcularNovoIMC() {
    String nome = nomeController.text;
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text);

    Pessoa pessoa = Pessoa(nome: nome, peso: peso, altura: altura);

    setState(() {
      pessoas.insert(0, pessoa);
      nomeController.clear();
      pesoController.clear();
      alturaController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
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
      body: Column(
        children: [
          Expanded(
            child: PageView(
              //controller: controller,
              onPageChanged: (value) {
                setState(() {
                  //posicaoPagina = value;
                });
              },
              //scrollDirection: Axis.vertical,
              children: const [
                // CardPage(),
                // ImageAssetsPage(),
                // ListViewPage(),
                // ListViewHorizontal(),
                // TarefaPage()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
