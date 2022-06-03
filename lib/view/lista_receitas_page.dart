import 'package:cooking_agenda/controllers/receitas_controller.dart';
import 'package:cooking_agenda/models/receitas_model.dart';
import 'package:flutter/material.dart';

class ListaReceitas extends StatefulWidget {
  const ListaReceitas({Key? key}) : super(key: key);

  @override
  State<ListaReceitas> createState() => _ListaReceitasState();
}

class _ListaReceitasState extends State<ListaReceitas> {
  ReceitasController controller = ReceitasController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas'),
      ),
      body: controller.receitasList.value.isEmpty
          ? const Center(
              child: Text('Nenhuma receita'),
            )
          : Column(
              children: [
                ValueListenableBuilder<List<ReceitasModel>>(
                  valueListenable: controller.receitasList,
                  builder: (_, list, __) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (_, index) => ListTile(
                        leading: Text(list[index].idReceita.toString()),
                        title: Text(list[index].nomeReceita as String),
                        onTap: () {
                          setState(() {
                            Navigator.of(context).pushNamed('/detalhesReceitas',
                                arguments: list[index]);
                          });
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/adicionarReceitas');
          },
          child: const Icon(Icons.restaurant_menu_rounded)),
    );
  }
}
