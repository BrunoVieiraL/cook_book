import 'package:flutter/material.dart';

import 'package:cooking_agenda/models/receitas_model.dart';

class DetalhesReceitas extends StatefulWidget {
  const DetalhesReceitas({Key? key}) : super(key: key);

  @override
  State<DetalhesReceitas> createState() => _DetalhesReceitasState();
}

class _DetalhesReceitasState extends State<DetalhesReceitas> {
  @override
  Widget build(BuildContext context) {
    late ReceitasModel argsFromListaReceitas =
        ModalRoute.of(context)?.settings.arguments as ReceitasModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          argsFromListaReceitas.nomeReceita,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
            argsFromListaReceitas.ingredientes ,
          ),
          Text(
            argsFromListaReceitas.modoPreparo ,
          ),
        ],
      ),
    );
  }
}
