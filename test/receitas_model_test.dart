import 'package:cook_book/models/receitas_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final ReceitasModel model = ReceitasModel(
      nomeReceita: 'nomeReceita',
      ingredientes: 'ingredientes',
      modoPreparo: 'modoPreparo',
      tipoReceita: 'tipoReceita');

  test('nomeReceita Deve vir uma string', () {
    expect(model.nomeReceita, "nomeReceita");
    expect(model.nomeReceita, isA<String>());
  });
  test('ID pode ser nulo', () {
    expect(model.id, isNull);
    expect(model.id, isA<int?>());
  });
}
