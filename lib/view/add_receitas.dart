import 'package:cooking_agenda/database/receitas_database.dart';
import 'package:cooking_agenda/models/receitas_model.dart';
import 'package:flutter/material.dart';

class AddReceitaPage extends StatefulWidget {
  const AddReceitaPage({Key? key}) : super(key: key);

  @override
  State<AddReceitaPage> createState() => _AddReceitaPageState();
}

class _AddReceitaPageState extends State<AddReceitaPage> {
  TextEditingController nomeReceita = TextEditingController();
  TextEditingController ingredientes = TextEditingController();
  TextEditingController modoPreparo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        ElevatedButton(
          onPressed: () async {
            setState(() {
              RecipeDatabase.instance.add(ReceitasModel(
                  nomeReceita: nomeReceita.text,
                  ingredientes: ingredientes.text,
                  modoPreparo: modoPreparo.text));
              Navigator.of(context).pop();
            });
          },
          child: const Text('Salvar'),
        ),
      ]),
      body: Column(
        children: [
          TextField(
            controller: nomeReceita,
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: ingredientes,
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: modoPreparo,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
