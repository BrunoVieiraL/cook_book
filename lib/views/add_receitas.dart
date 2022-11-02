import 'package:flutter/material.dart';
import '../database/receitas_database.dart';
import '../models/receitas_model.dart';
import '../widgets/widgets.dart';

class AddReceitaPage extends StatefulWidget {
  const AddReceitaPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddReceitaPage> createState() => _AddReceitaPageState();
}

class _AddReceitaPageState extends State<AddReceitaPage> {
  TextEditingController nomeReceita = TextEditingController();
  TextEditingController ingredientes = TextEditingController();
  TextEditingController modoPreparo = TextEditingController();
  List<String> listTipoReceita = ['Entrada', 'Prato Principal', 'Sobremesa'];
  String? tipoReceita;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final appBarSize = height * 0.13;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: appBarSize,
        title: const Text(
          'Adicionar Receita',
          style: TextStyle(
              color: Colors.black,
              shadows: [
                Shadow(
                  color: Colors.white,
                  offset: Offset(0, 3),
                  blurRadius: 15,
                ),
              ],
              fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          TextFieldCustomWidget(
            controller: nomeReceita,
            textInputAction: TextInputAction.next,
            hintText: 'Nome da Receita',
            maxLines: 1,
          ),
          TextFieldCustomWidget(
            controller: ingredientes,
            textInputAction: TextInputAction.next,
            hintText: 'Ingredientes',
            maxLines: 5,
          ),
          TextFieldCustomWidget(
            controller: modoPreparo,
            textInputAction: TextInputAction.done,
            hintText: 'Modo de Preparo',
            maxLines: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Tipo da Receita'),
              DropdownButton<String>(
                hint: const Text('Tipo da Receita'),
                items: listTipoReceita
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    tipoReceita = newValue;
                  });
                },
                value: tipoReceita ??= listTipoReceita[1],
              ),
            ],
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () async {
                  if (nomeReceita.text.isEmpty ||
                      ingredientes.text.isEmpty ||
                      modoPreparo.text.isEmpty ||
                      tipoReceita == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Preencha os Campos e escolha um tipo de receita',
                          style: TextStyle(fontSize: 15),
                        ),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  } else {
                    setState(
                      () {
                        RecipeDatabase.instance.add(
                          ReceitasModel(
                              nomeReceita: nomeReceita.text,
                              ingredientes: ingredientes.text,
                              modoPreparo: modoPreparo.text,
                              tipoReceita: tipoReceita!),
                        );
                        Navigator.of(context).pop();
                      },
                    );
                  }
                },
                child: const Text('Salvar'),
              ),
              const Icon(Icons.check),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar'),
              ),
              const Icon(Icons.close),
            ],
          )
        ],
      ),
    );
  }
}
