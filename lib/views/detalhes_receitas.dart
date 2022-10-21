import 'package:cook_book/models/receitas_model.dart';
import 'package:flutter/material.dart';

class DetalhesReceitas extends StatefulWidget {
  const DetalhesReceitas({Key? key}) : super(key: key);
  @override
  State<DetalhesReceitas> createState() => _DetalhesReceitasState();
}

class _DetalhesReceitasState extends State<DetalhesReceitas> {
  @override
  Widget build(BuildContext context) {
    ReceitasModel argsFromListaReceitas =
        ModalRoute.of(context)!.settings.arguments as ReceitasModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          argsFromListaReceitas.nomeReceita,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                argsFromListaReceitas.ingredientes.replaceAll(', ', '\n'),
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                argsFromListaReceitas.modoPreparo,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
