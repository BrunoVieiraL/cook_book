import 'package:cooking_agenda/models/receitas_model.dart';

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
            child: Container(
              color: Colors.amber,
              child: Text(
                argsFromListaReceitas.ingredientes
                    .replaceAll(',', '\n')
                    .trimLeft(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Text(
                argsFromListaReceitas.modoPreparo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
