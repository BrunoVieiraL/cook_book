import 'package:cooking_agenda/models/receitas_model.dart';
import 'package:cooking_agenda/view/editar_receitas.dart';
import 'package:flutter/material.dart';

import '../database/receitas_database.dart';

class DetalhesReceitas extends StatefulWidget {
  final int idReceita;
  const DetalhesReceitas({Key? key, required this.idReceita}) : super(key: key);

  @override
  State<DetalhesReceitas> createState() => _DetalhesReceitasState();
}

class _DetalhesReceitasState extends State<DetalhesReceitas> {
  late ReceitasModel receitas;
  bool isLoading = false;
  @override
  void initState() {
    refreshReceitas();
    super.initState();
  }

  Future refreshReceitas() async {
    setState(() {
      isLoading = true;
    });

    receitas = (await RecipeDatabase.instance.readRecipe(widget.idReceita));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ReceitasModel argsFromListaReceitas =
        ModalRoute.of(context)!.settings.arguments as ReceitasModel;

    return Scaffold(
      appBar: AppBar(
        actions: [editButton(), deleteButton()],
        title: Text(
          argsFromListaReceitas.nomeReceita,
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Text(
                  argsFromListaReceitas.ingredientes,
                ),
                Text(
                  argsFromListaReceitas.modoPreparo,
                ),
              ],
            ),
    );
  }

  Widget deleteButton() {
    return IconButton(
        onPressed: () async {
          await RecipeDatabase.instance.delete(widget.idReceita);
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.delete));
  }

  Widget editButton() {
    return IconButton(
      icon: const Icon(
        Icons.edit,
      ),
      onPressed: () async {
        if (isLoading) return;
        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditarReceitas(
            receitas: receitas,
          ),
        ));
        refreshReceitas();
      },
    );
  }
}
