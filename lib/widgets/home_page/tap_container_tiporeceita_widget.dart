import 'package:flutter/material.dart';

import '../../views/lista_receitas_page.dart';

class TapContainerTipoReceitaWidget extends StatelessWidget {
  const TapContainerTipoReceitaWidget({
    Key? key,
    required this.tipoReceita,
  }) : super(key: key);
  final String tipoReceita;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ListaReceitas(tipoReceita: tipoReceita);
        }));
      },
      child: Container(
        height: height * 0.07,
        width: width * 0.96,
        child: Baseline(
          baseline: 36,
          baselineType: TextBaseline.alphabetic,
          child: Text(
            ' $tipoReceita',
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 28, color: Colors.black),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          shape: BoxShape.rectangle,
          color: Colors.deepPurple.shade50,
        ),
      ),
    );
  }
}
