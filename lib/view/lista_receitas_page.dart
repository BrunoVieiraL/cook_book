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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/configPage');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
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
                  shrinkWrap: false,
                  children: snapshot.data!.map((recipes) {
                    return Slidable(
                      key: ValueKey<int>(recipes.id!),
                      endActionPane: ActionPane(
                        dragDismissible: false,
                        children: [
                          SlidableAction(
                              padding: const EdgeInsets.only(right: 5),
                              backgroundColor: Colors.green,
                              icon: Icons.edit,
                              onPressed: (BuildContext context) {
                                setState(() {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          settings:
                                              RouteSettings(arguments: recipes),
                                          builder: (context) {
                                            return const EditarReceitas();
                                          }));
                                });
                              }),
                          SlidableAction(
                            backgroundColor: Colors.redAccent.shade400,
                            icon: Icons.delete,
                            onPressed: ((BuildContext context) {
                              setState(() {
                                RecipeDatabase.instance.remove(recipes.id!);
                              });
                            }),
                          ),
                        ],
                        motion: const StretchMotion(),
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
                                settings: RouteSettings(arguments: recipes)),
                          );
                        },
                        title: Text(
                          recipes.nomeReceita,
                        ),
                      ),
                    );
                  }).toList());
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return const AddReceitaPage();
            }));
          },
          child: const Icon(Icons.restaurant_menu_rounded)),
    );
  }
}
