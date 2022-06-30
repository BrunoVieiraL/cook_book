import 'package:cooking_agenda/database/receitas_database.dart';
import 'package:cooking_agenda/models/receitas_model.dart';
import 'package:cooking_agenda/view/detalhes_receitas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'add_receitas.dart';
import 'editar_receitas.dart';

class ListaReceitas extends StatefulWidget {
  const ListaReceitas({Key? key}) : super(key: key);

  @override
  State<ListaReceitas> createState() => _ListaReceitasState();
}

class _ListaReceitasState extends State<ListaReceitas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas'),
      ),
      body: FutureBuilder<List<ReceitasModel>>(
        future: RecipeDatabase.instance.getReceitas(),
        builder: (BuildContext context,
            AsyncSnapshot<List<ReceitasModel>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Column(
                children: const [
                  CircularProgressIndicator(),
                  Text('Carregando receitas'),
                ],
              ),
            );
          }
          return snapshot.data!.isEmpty
              ? const Center(
                  child: Text('Nenhuma receita adicionada'),
                )
              : ListView(
                  shrinkWrap: true,
                  children: snapshot.data!.map((recipes) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Slidable(
                          key: ValueKey<int>(recipes.id!),
                          startActionPane: ActionPane(
                            dragDismissible: false,
                            children: [
                              SlidableAction(
                                  backgroundColor: Colors.green,
                                  icon: Icons.edit,
                                  onPressed: (BuildContext context) {
                                    setState(() {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              settings: RouteSettings(
                                                  arguments: recipes.id),
                                              builder: (context) {
                                                return const EditarReceitas();
                                              }));
                                    });
                                  }),
                            ],
                            motion: const ScrollMotion(),
                            dismissible: DismissiblePane(onDismissed: () {}),
                          ),
                          endActionPane: ActionPane(
                            dragDismissible: true,
                            children: [
                              SlidableAction(
                                backgroundColor: Colors.red,
                                icon: Icons.delete,
                                onPressed: ((BuildContext context) {
                                  setState(() {
                                    RecipeDatabase.instance.remove(recipes.id!);
                                  });
                                }),
                              ),
                            ],
                            motion: const ScrollMotion(),
                            dismissible: DismissiblePane(
                              onDismissed: () {},
                            ),
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) {
                                      return const DetalhesReceitas();
                                    },
                                    settings:
                                        RouteSettings(arguments: recipes)),
                              );
                            },
                            title: Text(recipes.nomeReceita),
                          ),
                        ),
                      ],
                    );
                  }).toList());
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const AddReceitaPage();
            }));
          },
          child: const Icon(Icons.restaurant_menu_rounded)),
    );
  }
}
