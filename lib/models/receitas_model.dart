const String tableRecipes = 'receitas';

class RecipeFields {
  static final List<String> values = [
    idReceita,
    nomeReceita,
    ingredientes,
    modoPreparo
  ];
  static const String idReceita = '_idReceita';
  static const String nomeReceita = 'nomeReceita';
  static const String ingredientes = 'ingredientes';
  static const String modoPreparo = 'modoPreparo';
}

class ReceitasModel {
  int? idReceita;
  String nomeReceita;
  String ingredientes;
  String modoPreparo;
  ReceitasModel(
      {this.idReceita,
      required this.nomeReceita,
      required this.ingredientes,
      required this.modoPreparo});

  @override
  String toString() {
    return 'idReceita: $idReceita, nomeReceita: $nomeReceita, ingredientes: $ingredientes, modoPreparo: $modoPreparo ';
  }

  static ReceitasModel fromJson(Map<String, Object?> json) => ReceitasModel(
        idReceita: json[RecipeFields.idReceita] as int?,
        nomeReceita: json[RecipeFields.nomeReceita] as String,
        ingredientes: json[RecipeFields.ingredientes] as String,
        modoPreparo: json[RecipeFields.modoPreparo] as String,
      );

  Map<String, Object?> toJson() => {
        RecipeFields.idReceita: idReceita,
        RecipeFields.nomeReceita: nomeReceita,
        RecipeFields.ingredientes: ingredientes,
        RecipeFields.modoPreparo: modoPreparo,
      };

  ReceitasModel copy({
    int? idReceita,
    String? nomeReceita,
    String? ingredientes,
    String? modoPreparo,
  }) =>
      ReceitasModel(
        idReceita: idReceita ?? this.idReceita,
        nomeReceita: nomeReceita ?? this.nomeReceita,
        ingredientes: ingredientes ?? this.ingredientes,
        modoPreparo: modoPreparo ?? this.modoPreparo,
      );
}
