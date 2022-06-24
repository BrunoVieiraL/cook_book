import 'package:cooking_agenda/database/receitas_database.dart';
import 'package:cooking_agenda/models/receitas_model.dart';
import 'package:cooking_agenda/view/detalhes_receitas.dart';
import 'package:flutter/material.dart';

import 'editar_receitas.dart';

class ListaReceitas extends StatefulWidget {
  const ListaReceitas({Key? key}) : super(key: key);

  @override
  State<ListaReceitas> createState() => _ListaReceitasState();
}

class _ListaReceitasState extends State<ListaReceitas> {
  late List<ReceitasModel> receitas;
  bool isLoading = false;
  @override
  void initState() {
    refreshReceitas();
    super.initState();
  }

  @override
  void dispose() {
    RecipeDatabase.instance.close();
    super.dispose();
  }

  Future refreshReceitas() async {
    setState(() {
      isLoading = true;
    });

    // ignore: unnecessary_this
    this.receitas = await RecipeDatabase.instance.readAllRecipes();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas'),
      ),
      body: receitas.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: receitas.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(receitas[index].toString()),
                        title: Text(receitas[index].nomeReceita),
                        onTap: () async {
                          await Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return DetalhesReceitas(
                                idReceita: receitas[index].idReceita!);
                          }));
                        },
                      );
                    }),
              ],
            ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (isLoading) return;
            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const EditarReceitas(),
            ));
            refreshReceitas();
          },
          child: const Icon(Icons.restaurant_menu_rounded)),
    );
  }
}
