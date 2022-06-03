import 'package:cooking_agenda/models/receitas_model.dart';
import 'package:flutter/cupertino.dart';

class ReceitasController {
  ValueNotifier<List<ReceitasModel>> receitasList = ValueNotifier<List<ReceitasModel>>([
    ReceitasModel(
      idReceita: 1,
      nomeReceita: 'macarrone',
      ingredientes: 'sal, tempero',
      modoPreparo: 'cozinhar 7 min',
    ),
    ReceitasModel(
      idReceita: 2,
      nomeReceita: 'sushi',
      ingredientes: 'sal, shoyo, arroz',
      modoPreparo: 'enrolar',
    ),
    ReceitasModel(
      idReceita: 3,
      nomeReceita: 'pastel',
      ingredientes: 'recheio',
      modoPreparo: 'fritar 3 minutos cada lado',
    )
  ]);

  addToList(
    int numID,
    String recipeName,
    String ingredients,
    String prepare,
  ) {
    return receitasList.value.add(
      ReceitasModel(
        idReceita: numID,
        nomeReceita: recipeName,
        ingredientes: ingredients,
        modoPreparo: prepare,
      ),
    );
  }

  
}
