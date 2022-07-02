import 'package:flutter/material.dart';

import '../models/receitas_model.dart';
import '../widgets/textfield_widget.dart';

class EditarouAdicionarReceitasColunmComponent extends StatelessWidget {
  const EditarouAdicionarReceitasColunmComponent({
    Key? key,
    required this.nomeReceita,
    this.argsIDFromHomePage,
    required this.ingredientes,
    required this.modoPreparo,
  }) : super(key: key);

  final TextEditingController nomeReceita;
  final ReceitasModel? argsIDFromHomePage;
  final TextEditingController ingredientes;
  final TextEditingController modoPreparo;

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
          textInputAction: TextInputAction.done,
          hintText: argsIDFromHomePage!.modoPreparo,
        ),
      ],
    );
  }
}
