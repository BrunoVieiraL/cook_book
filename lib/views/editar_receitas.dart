import 'package:cook_book/models/receitas_model.dart';
import 'package:flutter/material.dart';
import '../components/components.dart';

class EditarReceitas extends StatefulWidget {
  const EditarReceitas({super.key});

  @override
  State<EditarReceitas> createState() => _EditarReceitasState();
}

class _EditarReceitasState extends State<EditarReceitas> {
  TextEditingController nomeReceita = TextEditingController();
  TextEditingController ingredientes = TextEditingController();
  TextEditingController modoPreparo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ReceitasModel argsIDFromHomePage =
        ModalRoute.of(context)!.settings.arguments as ReceitasModel;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: height * 0.13,
        title: const Text(
          'Editar Receita',
          style: TextStyle(
              color: Colors.black,
              shadows: [
                Shadow(
                  color: Colors.white,
                  offset: Offset(0, 3),
                ),
              ],
              fontSize: 30),
        ),
      ),
      body: EditReceitasColunmComponent(
        nomeReceita: nomeReceita,
        argsIDFromHomePage: argsIDFromHomePage,
        ingredientes: ingredientes,
        modoPreparo: modoPreparo,
        tipoReceita: argsIDFromHomePage.tipoReceita,
      ),
    );
  }
}
