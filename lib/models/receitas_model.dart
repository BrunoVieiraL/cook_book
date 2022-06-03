class ReceitasModel {
  int? idReceita;
  String? nomeReceita;
  String? ingredientes;
  String? modoPreparo;
  ReceitasModel(
      {this.idReceita, this.nomeReceita, this.ingredientes, this.modoPreparo});

  @override
  String toString() {
    return 'idReceita: $idReceita, nomeReceita: $nomeReceita, ingredientes: $ingredientes, modoPreparo: $modoPreparo ';
  }
}
