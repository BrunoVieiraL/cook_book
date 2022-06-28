class ReceitasModel {
  int? id;
  String nomeReceita;
  String ingredientes;
  String modoPreparo;
  ReceitasModel(
      {this.id,
      required this.nomeReceita,
      required this.ingredientes,
      required this.modoPreparo});

  factory ReceitasModel.fromMap(Map<String, dynamic> json) {
    return ReceitasModel(
      id: json['id'],
      nomeReceita: json['nomeReceita'],
      ingredientes: json['ingredientes'],
      modoPreparo: json['modoPreparo'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomeReceita': nomeReceita,
      'ingredientes': ingredientes,
      'modoPreparo': modoPreparo
    };
  }
}
