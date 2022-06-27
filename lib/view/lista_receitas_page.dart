import 'package:cooking_agenda/database/receitas_database.dart';
import 'package:cooking_agenda/models/receitas_model.dart';
import 'package:cooking_agenda/view/add_receitas.dart';
import 'package:cooking_agenda/view/detalhes_receitas.dart';
import 'package:cooking_agenda/view/editar_receitas.dart';
import 'package:flutter/material.dart';

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
              : ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    setState(() {
                      snapshot.data!.map((recipes) {
                        return Center(
                          child: Dismissible(
                            background: Container(
                              color: Colors.green,
                              child: const Icon(Icons.edit),
                            ),
                            secondaryBackground: Container(
                              color: Colors.red,
                              child: const Icon(Icons.delete),
                            ),
                            onDismissed: (direction) {
                              if (direction == DismissDirection.startToEnd) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const EditarReceitas();
                                    },
                                  ),
                                );
                              }
                              if (direction == DismissDirection.endToStart) {
                                setState(() {
                                  RecipeDatabase.instance
                                      .remove(recipes.idReceita!);
                                });
                              }
                            },
                            key: ValueKey<int>(
                                snapshot.data![index].idReceita as int),
                            child: ListTile(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return const DetalhesReceitas();
                                  }, settings: RouteSettings(arguments: recipes)),
                                );
                              },
                              leading: Text(recipes.idReceita.toString()),
                              title: Text(recipes.nomeReceita),
                            ),
                          ),
                        );
                      }).toList();
                    });

                    return const Center(
                      child: Text('Erro'),
                    );
                  },
                );
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
