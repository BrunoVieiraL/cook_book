import 'package:cook_book/database/receitas_database.dart';
import 'package:cook_book/models/receitas_model.dart';
import 'package:cook_book/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListaReceitas extends StatefulWidget {
  const ListaReceitas({required this.tipoReceita, super.key});
  final String tipoReceita;

  @override
  State<ListaReceitas> createState() => _ListaReceitasState();
}

class _ListaReceitasState extends State<ListaReceitas> {
  final List<String> listTipoReceita = [
    'Entrada',
    'Prato Principal',
    'Sobremesa'
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.078,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return ListaReceitas(
                          tipoReceita: widget.tipoReceita == listTipoReceita[0]
                              ? listTipoReceita[2]
                              : widget.tipoReceita == listTipoReceita[2]
                                  ? listTipoReceita[1]
                                  : listTipoReceita[0]);
                    }));
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              Text(
                widget.tipoReceita,
                style: const TextStyle(
                    fontSize: 45,
                    shadows: [
                      Shadow(
                          color: Colors.white,
                          offset: Offset(1, 5),
                          blurRadius: 8),
                    ],
                    color: Colors.black),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return ListaReceitas(
                          tipoReceita: widget.tipoReceita == listTipoReceita[2]
                              ? listTipoReceita[0]
                              : widget.tipoReceita == listTipoReceita[1]
                                  ? listTipoReceita[2]
                                  : listTipoReceita[1]);
                    }));
                  },
                  icon: const Icon(Icons.arrow_forward_ios)),
            ],
          ),
          SizedBox(
            height: height * 0.078,
          ),
          FutureBuilder<List<ReceitasModel>>(
            future: RecipeDatabase.instance.getReceitas(widget.tipoReceita),
            builder: (BuildContext context,
                AsyncSnapshot<List<ReceitasModel>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando receitas'),
                    ],
                  ),
                );
              }
              return snapshot.data!.isEmpty
                  ? Center(
                      heightFactor: height * 0.023,
                      child: const Text(
                        'Nenhuma Receita Adicionada',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : ListView(
                      padding: const EdgeInsets.all(5),
                      shrinkWrap: true,
                      children: snapshot.data!.map((recipes) {
                        return Slidable(
                          endActionPane: ActionPane(
                            dragDismissible: false,
                            motion: const DrawerMotion(),
                            dismissible: DismissiblePane(
                              onDismissed: () {},
                            ),
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
