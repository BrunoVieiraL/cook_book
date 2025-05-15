import 'package:flutter/material.dart';
import '../../database/receitas_database.dart';
import '../../models/receitas_model.dart';
import '../../views/views.dart';
import '../../widgets/widgets.dart';

class EditReceitasColunmComponent extends StatefulWidget {
  const EditReceitasColunmComponent({
    super.key,
    required this.nomeReceita,
    this.argsIDFromHomePage,
    required this.ingredientes,
    required this.modoPreparo,
    required this.tipoReceita,
  });

  final TextEditingController nomeReceita;
  final ReceitasModel? argsIDFromHomePage;
  final TextEditingController ingredientes;
  final TextEditingController modoPreparo;
  final String tipoReceita;

  @override
  State<EditReceitasColunmComponent> createState() =>
      _EditReceitasColunmComponentState();
}

class _EditReceitasColunmComponentState
    extends State<EditReceitasColunmComponent> {
  List<String> listTipoReceita = ['Entrada', 'Prato Principal', 'Sobremesa'];

  @override
  Widget build(BuildContext context) {
    widget.nomeReceita.text = widget.argsIDFromHomePage!.nomeReceita;
    widget.ingredientes.text = widget.argsIDFromHomePage!.ingredientes;
    widget.modoPreparo.text = widget.argsIDFromHomePage!.modoPreparo;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          TextFieldCustomWidget(
            controller: widget.nomeReceita,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            hintText: 'Nome da Receita',
          ),
          TextFieldCustomWidget(
            controller: widget.ingredientes,
            textInputAction: TextInputAction.next,
            maxLines: 5,
            hintText: 'Ingredientes',
          ),
          TextFieldCustomWidget(
            controller: widget.modoPreparo,
            textInputAction: TextInputAction.next,
            maxLines: 10,
            hintText: 'Modo de Preparo',
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
                    widget.argsIDFromHomePage!.tipoReceita = newValue!;
                  });
                },
                value: widget.argsIDFromHomePage!.tipoReceita,
              ),
            ],
          ),
          SizedBox(height: height * 0.026),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () async {
                  setState(
                    () {
                      RecipeDatabase.instance.update(
                        ReceitasModel(
                            id: widget.argsIDFromHomePage!.id,
                            nomeReceita: widget.nomeReceita.text,
                            ingredientes: widget.ingredientes.text,
                            modoPreparo: widget.modoPreparo.text,
                            tipoReceita:
                                widget.argsIDFromHomePage!.tipoReceita),
                      );
                    },
                  );
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return ListaReceitas(
                            tipoReceita:
                                widget.argsIDFromHomePage!.tipoReceita);
                      },
                    ),
                  );
                },
                child: const Text('Salvar alteração'),
              ),
              const Icon(Icons.check),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return ListaReceitas(
                            tipoReceita:
                                widget.argsIDFromHomePage!.tipoReceita);
                      },
                    ),
                  );
                },
                child: const Text('Cancelar'),
              ),
              const Icon(Icons.close),
            ],
          ),
        ],
      ),
    );
  }
}
