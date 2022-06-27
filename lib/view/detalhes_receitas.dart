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
        children: [
          Text(
            argsFromListaReceitas.ingredientes,
          ),
          Text(
            argsFromListaReceitas.modoPreparo,
          ),
        ],
      ),
    );
  }

  Widget deleteButton() {
    return IconButton(
        onPressed: () async {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.delete));
  }

  Widget editButton() {
    return IconButton(
      icon: const Icon(
        Icons.edit,
      ),
      onPressed: () async {},
    );
  }
}
