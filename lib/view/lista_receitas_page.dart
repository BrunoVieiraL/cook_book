import 'package:cooking_agenda/models/receitas_model.dart';
import 'package:flutter/material.dart';

class ListaReceitas extends StatefulWidget {
  const ListaReceitas({Key? key}) : super(key: key);

  @override
  State<ListaReceitas> createState() => _ListaReceitasState();
}

class _ListaReceitasState extends State<ListaReceitas> {
  @override
  Widget build(BuildContext context) {
    late ReceitasModel argsFromAddReceitas =
        ModalRoute.of(context)!.settings.arguments as ReceitasModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: argsFromAddReceitas.idReceita,
              itemBuilder: (_, index) => ListTile(
                title: Text(argsFromAddReceitas.nomeReceita),
                onTap: () {
                  Navigator.of(context).pushNamed('/detalhes', arguments: [
                    argsFromAddReceitas.idReceita,
                    argsFromAddReceitas.ingredientes,
                    argsFromAddReceitas.modoPreparo,
                    argsFromAddReceitas.nomeReceita
                  ]);
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/addReceitas');
              },
              child: const Text('Adicionar Receita'),
            ),
          ],
        ),
      ),
    );
  }
}
