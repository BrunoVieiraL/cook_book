import 'package:cooking_agenda/database/receitas_database.dart';
import 'package:cooking_agenda/models/receitas_model.dart';
import 'package:flutter/material.dart';

class EditarReceitas extends StatefulWidget {
  const EditarReceitas({Key? key}) : super(key: key);

  @override
  State<EditarReceitas> createState() => _EditarReceitasState();
}

class _EditarReceitasState extends State<EditarReceitas> {
  TextEditingController nomeReceita = TextEditingController();
  TextEditingController ingredientes = TextEditingController();
  TextEditingController modoPreparo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int argsIDFromHomePage =
        ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(actions: [
        ElevatedButton(
            onPressed: () async {
              setState(() {
                RecipeDatabase.instance.update(ReceitasModel(
                    id: argsIDFromHomePage,
                    nomeReceita: nomeReceita.text,
                    ingredientes: ingredientes.text,
                    modoPreparo: modoPreparo.text));
              });
              Navigator.of(context).pop();
            },
            child: const Text('Salvar alteração'))
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
