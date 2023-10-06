import 'package:flutter/material.dart';

import '../model/pessoa.dart';

class CalcularImcPage extends StatefulWidget {
  const CalcularImcPage({super.key});

  @override
  State<CalcularImcPage> createState() => _CalcularImcPageState();
}

class _CalcularImcPageState extends State<CalcularImcPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  List<Pessoa> pessoas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meus Dados"),
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
                    Navigator.pop(context);
                  },
                  child: const Text("Salvar"))
            ],
          ),
        ));
  }
}
