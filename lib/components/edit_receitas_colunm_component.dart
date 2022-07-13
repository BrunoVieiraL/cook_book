import 'package:flutter/material.dart';

import '../models/receitas_model.dart';
import '../widgets/textfield_widget.dart';

class EditReceitasColunmComponent extends StatelessWidget {
  const EditReceitasColunmComponent({
    Key? key,
    required this.nomeReceita,
    this.argsIDFromHomePage,
    required this.ingredientes,
    required this.modoPreparo,
    required this.tipoReceita,
  }) : super(key: key);

  final TextEditingController nomeReceita;
  final ReceitasModel? argsIDFromHomePage;
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
          hintText: argsIDFromHomePage!.nomeReceita,
        ),
        TextFieldCustomWidget(
          controller: ingredientes,
          textInputAction: TextInputAction.next,
          hintText: argsIDFromHomePage!.ingredientes,
        ),
        TextFieldCustomWidget(
          controller: modoPreparo,
          textInputAction: TextInputAction.next,
          hintText: argsIDFromHomePage!.modoPreparo,
        ),
        TextFieldCustomWidget(
          controller: tipoReceita,
          hintText: argsIDFromHomePage!.tipoReceita,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
