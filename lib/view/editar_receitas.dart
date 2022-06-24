import 'package:cooking_agenda/database/receitas_database.dart';
import 'package:cooking_agenda/models/receitas_model.dart';
import 'package:flutter/material.dart';

class EditarReceitas extends StatefulWidget {
  final ReceitasModel? receitas;
  const EditarReceitas({Key? key, this.receitas}) : super(key: key);

  @override
  State<EditarReceitas> createState() => _EditarReceitasState();
}

class _EditarReceitasState extends State<EditarReceitas> {
  final _formKey = GlobalKey<FormState>();

  void addOrUpdateRecipe() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final isUpdating = widget.receitas != null;
      if (isUpdating) {
        await updateRecipe();
      } else {
        addRecipe();
      }
      Navigator.of(context).pop();
    }
  }

  Future updateRecipe() async {
    final recipe = widget.receitas!.copy(
        nomeReceita: nomeReceita as String,
        ingredientes: ingredients as String,
        modoPreparo: prepare as String);
    await RecipeDatabase.instance.update(recipe);
  }

  Future addRecipe() async {
    final recipe = ReceitasModel(
        nomeReceita: nomeReceita as String,
        ingredientes: ingredients as String,
        modoPreparo: prepare as String);
    await RecipeDatabase.instance.create(recipe);
  }

  final TextEditingController nomeReceita = TextEditingController();
  final TextEditingController ingredients = TextEditingController();
  final TextEditingController prepare = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        ElevatedButton(
            onPressed: () {
              addOrUpdateRecipe();
            },
            child: const Text('Salvar'))
      ]),
      body: Column(
        children: [
          TextField(
            controller: nomeReceita,
          ),
          TextField(
            controller: ingredients,
          ),
          TextField(
            controller: prepare,
          ),
        ],
      ),
    );
  }
}
