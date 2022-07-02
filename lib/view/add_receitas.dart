import 'package:cooking_agenda/components/editar_receitas_colunm_component.dart';
import 'package:cooking_agenda/view/lista_receitas_page.dart';
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

  @override
  Widget build(BuildContext context) {
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
                  if (nomeReceita.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Insira ao menos o nome da receita',
                        style: TextStyle(fontSize: 15),
                      ),
                      duration: Duration(seconds: 3),
                    ));
                  } else {
                    setState(() {
                      RecipeDatabase.instance.add(ReceitasModel(
                          nomeReceita: nomeReceita.text,
                          ingredientes: ingredientes.text,
                          modoPreparo: modoPreparo.text));
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return const ListaReceitas();
                      }));
                    });
                  }
                },
                child: const Text('Salvar'),
              ),
            ]),
        body: EditarouAdicionarReceitasColunmComponent(
          nomeReceita: nomeReceita,
          ingredientes: ingredientes,
          modoPreparo: modoPreparo,
        ));
  }
}
