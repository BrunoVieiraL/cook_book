import 'package:cooking_agenda/models/receitas_model.dart';
import 'package:flutter/material.dart';

class AddReceitas extends StatefulWidget {
  const AddReceitas({Key? key}) : super(key: key);

  @override
  State<AddReceitas> createState() => _AddReceitasState();
}

class _AddReceitasState extends State<AddReceitas> {
  @override
  Widget build(BuildContext context) {
    ReceitasModel receitasModel = ReceitasModel();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Receitas'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (recipeName) {
              setState(
                () {
                  receitasModel.nomeReceita = recipeName;
                },
              );
            },
          ),
          TextField(
            onChanged: (recipeIngredients) {
              setState(
                () {
                  receitasModel.ingredientes = recipeIngredients;
                },
              );
            },
          ),
          TextField(
            onChanged: (recipePrepareMode) {
              setState(
                () {
                  receitasModel.modoPreparo = recipePrepareMode;
                },
              );
            },
          ),
          TextButton(
            onPressed: () {
              setState(
                () {
                  if (receitasModel.nomeReceita.isNotEmpty &&
                      receitasModel.ingredientes.isNotEmpty &&
                      receitasModel.modoPreparo.isNotEmpty) {
                    receitasModel.idReceita = (receitasModel.idReceita + 1);
                    Navigator.of(context).popAndPushNamed(
                      '/listReceitas',
                      arguments: receitasModel,
                    );
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              );
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}
