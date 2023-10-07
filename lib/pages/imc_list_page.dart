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
  var nomeController = TextEditingController();
  var pesoController = TextEditingController();
  var alturaController = TextEditingController();
  double pesoDouble = 0.0;
  double alturaDouble = 0.0;
  List<Pessoa> pessoas = [];
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
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            //descricaoController.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Adicionar pessoa"),
                    content: Wrap(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: nomeController,
                            decoration:
                                const InputDecoration(labelText: 'Nome'),
                          ),
                        ),
                        TextField(
                          controller: pesoController,
                          decoration:
                              const InputDecoration(labelText: 'Peso (kg)'),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: alturaController,
                          decoration:
                              const InputDecoration(labelText: 'Altura (m)'),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar")),
                      TextButton(
                          onPressed: () {
                            if (nomeController.text.trim() == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Nome deve ser preenchido")));
                              return;
                            }
                            if (pesoController.text.trim() == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Peso deve ser preenchido")));
                              return;
                            }
                            if (alturaController.text.trim() == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Altura deve ser preenchida")));
                              return;
                            }

                            setState(() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Dados salvos com sucesso!")));
                              //salvando = true;
                            });
                            try {
                              pesoDouble = double.parse(pesoController.text);
                            } catch (e) {
                              debugPrint('Erro ao converter para double: $e');
                            }
                            try {
                              alturaDouble =
                                  double.parse(alturaController.text);
                            } catch (e) {
                              debugPrint('Erro ao converter para double: $e');
                            }
                            pessoaRepository
                                .adicionar(Pessoa(nomeController.text, 2, 10));
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: const Text("Salvar"))
                    ],
                  );
                });
          }),
      body: ListView.builder(
          itemCount: _pessoas.length,
          itemBuilder: (BuildContext bc, int index) {
            var pessoa = _pessoas[index];
            return Text(pessoa.getNome());
          }),
    );
  }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*Scaffold(
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
*/