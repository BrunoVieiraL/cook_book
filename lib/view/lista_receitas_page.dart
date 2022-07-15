import 'package:cooking_agenda/database/receitas_database.dart';
import 'package:cooking_agenda/models/receitas_model.dart';
import 'package:cooking_agenda/view/detalhes_receitas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'editar_receitas.dart';

class ListaReceitas extends StatefulWidget {
  const ListaReceitas({required this.tipoReceita, Key? key}) : super(key: key);
  final String tipoReceita;

  @override
  State<ListaReceitas> createState() => _ListaReceitasState();
}

class _ListaReceitasState extends State<ListaReceitas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            widget.tipoReceita,
            style: const TextStyle(
                fontSize: 50,
                shadows: [
                  Shadow(
                      color: Colors.white, offset: Offset(1, 5), blurRadius: 8),
                ],
                color: Colors.black),
          ),
          const SizedBox(
            height: 30,
          ),
          FutureBuilder<List<ReceitasModel>>(
            future: RecipeDatabase.instance.getReceitas(widget.tipoReceita),
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
                      heightFactor: 25,
                      child: Text(
                        'Nenhuma Receita Adicionada',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : ListView(
                      padding: const EdgeInsets.all(5),
                      shrinkWrap: true,
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
                                              settings: RouteSettings(
                                                  arguments: recipes),
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
                            motion: const DrawerMotion(),
                            dismissible: DismissiblePane(
                              onDismissed: () {},
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              color: const Color(0xFFD1C3DC),
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const DetalhesReceitas();
                                      },
                                      settings:
                                          RouteSettings(arguments: recipes),
                                    ),
                                  );
                                },
                                title: Text(
                                  recipes.nomeReceita,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
            },
          ),
        ],
      ),
    );
  }
}
