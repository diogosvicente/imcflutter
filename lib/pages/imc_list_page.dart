import 'package:flutter/material.dart';

class ImcListPage extends StatefulWidget {
  const ImcListPage({super.key});

  @override
  State<ImcListPage> createState() => _ImcListPageState();
}

class _ImcListPageState extends State<ImcListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
      ),
      body: ListView(children: [Text("test")]),
    );
  }
}
