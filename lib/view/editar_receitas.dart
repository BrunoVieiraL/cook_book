import 'package:cooking_agenda/database/receitas_database.dart';
import 'package:cooking_agenda/models/receitas_model.dart';
import 'package:cooking_agenda/view/lista_receitas_page.dart';
import 'package:flutter/material.dart';

import '../components/editar_receitas_colunm_component.dart';



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
    ReceitasModel argsIDFromHomePage =
        ModalRoute.of(context)!.settings.arguments as ReceitasModel;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return const ListaReceitas();
              }));
            },
          ),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    RecipeDatabase.instance.update(ReceitasModel(
                        id: argsIDFromHomePage.id,
                        nomeReceita: nomeReceita.text,
                        ingredientes: ingredientes.text,
                        modoPreparo: modoPreparo.text));
                  });
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const ListaReceitas();
                  }));
                },
                child: const Text('Salvar alteração'))
          ]),
      body: EditarouAdicionarReceitasColunmComponent(
          nomeReceita: nomeReceita,
          argsIDFromHomePage: argsIDFromHomePage,
          ingredientes: ingredientes,
          modoPreparo: modoPreparo),
    );
  }
}
