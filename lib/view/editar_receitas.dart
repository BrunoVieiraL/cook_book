import 'package:cooking_agenda/database/receitas_database.dart';
import 'package:cooking_agenda/models/receitas_model.dart';
import 'package:cooking_agenda/view/lista_receitas_page.dart';
import 'package:flutter/material.dart';

import '../components/edit_receitas_colunm_component.dart';

class EditarReceitas extends StatefulWidget {
  const EditarReceitas({Key? key}) : super(key: key);

  @override
  State<EditarReceitas> createState() => _EditarReceitasState();
}

class _EditarReceitasState extends State<EditarReceitas> {
  TextEditingController nomeReceita = TextEditingController();
  TextEditingController ingredientes = TextEditingController();
  TextEditingController modoPreparo = TextEditingController();
  TextEditingController tipoReceita = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ReceitasModel argsIDFromHomePage =
        ModalRoute.of(context)!.settings.arguments as ReceitasModel;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Editar Receita'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return ListaReceitas(
                  tipoReceita: tipoReceita.text,
                );
              }));
            },
          ),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  setState(
                    () {
                      RecipeDatabase.instance.update(
                        ReceitasModel(
                          id: argsIDFromHomePage.id,
                          nomeReceita: nomeReceita.text,
                          ingredientes: ingredientes.text,
                          modoPreparo: modoPreparo.text,
                          tipoReceita: tipoReceita.text,
                        ),
                      );
                    },
                  );
                  Navigator.of(context).pop();
                },
                child: const Text('Salvar alteração'))
          ]),
      body: EditReceitasColunmComponent(
        nomeReceita: nomeReceita,
        argsIDFromHomePage: argsIDFromHomePage,
        ingredientes: ingredientes,
        modoPreparo: modoPreparo,
        tipoReceita: tipoReceita,
      ),
    );
  }
}
