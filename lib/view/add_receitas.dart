import 'package:cooking_agenda/components/add_receitas_colunm_component.dart';
import 'package:flutter/material.dart';

import 'package:cooking_agenda/database/receitas_database.dart';
import 'package:cooking_agenda/models/receitas_model.dart';

class AddReceitaPage extends StatefulWidget {
  const AddReceitaPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddReceitaPage> createState() => _AddReceitaPageState();
}

class _AddReceitaPageState extends State<AddReceitaPage> {
  TextEditingController nomeReceita = TextEditingController();
  TextEditingController ingredientes = TextEditingController();
  TextEditingController modoPreparo = TextEditingController();
  TextEditingController tipoReceita = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Receita'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              if (nomeReceita.text.isEmpty &&
                  ingredientes.text.isEmpty &&
                  modoPreparo.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Preencha os Campos',
                      style: TextStyle(fontSize: 15),
                    ),
                    duration: Duration(seconds: 3),
                  ),
                );
              } else {
                setState(
                  () {
                    RecipeDatabase.instance.add(
                      ReceitasModel(
                          nomeReceita: nomeReceita.text,
                          ingredientes: ingredientes.text,
                          modoPreparo: modoPreparo.text,
                          tipoReceita: tipoReceita.text),
                    );
                    Navigator.of(context).pop(
                     );
                  },
                );
              }
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
      body: AddReceitasColunmComponent(
        nomeReceita: nomeReceita,
        ingredientes: ingredientes,
        modoPreparo: modoPreparo,
        tipoReceita: tipoReceita,
      ),
    );
  }
}
