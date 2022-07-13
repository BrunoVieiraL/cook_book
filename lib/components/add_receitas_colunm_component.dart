import 'package:flutter/material.dart';

import '../widgets/textfield_widget.dart';

class AddReceitasColunmComponent extends StatelessWidget {
  const AddReceitasColunmComponent({
    Key? key,
    required this.nomeReceita,
    required this.ingredientes,
    required this.modoPreparo,
    required this.tipoReceita,
  }) : super(key: key);

  final TextEditingController nomeReceita;
  final TextEditingController ingredientes;
  final TextEditingController modoPreparo;
  final TextEditingController tipoReceita;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldCustomWidget(
          controller: nomeReceita,
          textInputAction: TextInputAction.next,
          hintText: 'Nome da Receita',
        ),
        TextFieldCustomWidget(
          controller: ingredientes,
          textInputAction: TextInputAction.next,
          hintText: 'Ingredientes',
        ),
        TextFieldCustomWidget(
          controller: modoPreparo,
          textInputAction: TextInputAction.next,
          hintText: 'Modo de Preparo',
        ),
        TextFieldCustomWidget(
          controller: tipoReceita,
          hintText: 'Tipo da Receita',
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
