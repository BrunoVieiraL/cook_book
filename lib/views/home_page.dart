import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.14,
            ),
            const Center(
              child: Text(
                'Receitas',
                style: TextStyle(
                  fontSize: 45,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 4),
                      color: Colors.white,
                      blurRadius: 15,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.125,
            ),
            const TapContainerTipoReceitaWidget(tipoReceita: 'Entrada'),
            SizedBox(
              height: height * 0.017,
            ),
            const TapContainerTipoReceitaWidget(tipoReceita: 'Prato Principal'),
            SizedBox(
              height: height * 0.017,
            ),
            const TapContainerTipoReceitaWidget(tipoReceita: 'Sobremesa'),
            SizedBox(
              height: height * 0.125,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed('/addReceita');
                },
                icon: const Icon(
                  Icons.add_circle_outline,
                ),
                label: const Text(
                  'Adicionar Receita',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed('/configPage');
                },
                icon: const Icon(
                  Icons.settings_outlined,
                ),
                label: const Text(
                  'Configurações',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
