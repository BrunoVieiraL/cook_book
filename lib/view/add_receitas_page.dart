import 'package:cooking_agenda/controllers/receitas_controller.dart';
import 'package:flutter/material.dart';

class AdicionarReceitas extends StatefulWidget {
  const AdicionarReceitas({Key? key}) : super(key: key);

  @override
  State<AdicionarReceitas> createState() => _AdicionarReceitasState();
}

class _AdicionarReceitasState extends State<AdicionarReceitas> {
  ReceitasController controller = ReceitasController();
  late String _nomeReceita;
  late String _ingredients;
  late String _prepare;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Receitas'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (title) {
              _nomeReceita = title;
            },
          ),
          TextField(
            onChanged: (ingredientes) {
              _ingredients = ingredientes;
            },
          ),
          TextField(
            onChanged: (preparo) {
              _prepare = preparo;
            },
          ),
          TextButton(
            onPressed: () {
              setState(() {
                controller.addToList(controller.receitasList.value.length + 1,
                    _nomeReceita, _ingredients, _prepare);
                print(controller.receitasList);
                Navigator.of(context).popAndPushNamed('/listaReceitas');
              });
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}
