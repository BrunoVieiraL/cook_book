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

  factory ReceitasModel.fromMap(Map<String, dynamic> json) {
    return ReceitasModel(
      idReceita: json['idReceita'],
      nomeReceita: json['nomeReceita'],
      ingredientes: json['ingredientes'],
      modoPreparo: json['modoPreparo'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'idReceita': idReceita,
      'nomeReceita': nomeReceita,
      'ingredientes': ingredientes,
      'modoPreparo': modoPreparo
    };
  }
}
