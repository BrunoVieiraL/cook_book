import 'package:flutter/material.dart';

import '../widgets/home_page/tap_container_tiporeceita_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 90,
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
            const SizedBox(
              height: 80,
            ),
            const TapContainerTipoReceitaWidget(tipoReceita: 'Entrada'),
            const SizedBox(
              height: 10,
            ),
            const TapContainerTipoReceitaWidget(tipoReceita: 'Prato Principal'),
            const SizedBox(
              height: 10,
            ),
            const TapContainerTipoReceitaWidget(tipoReceita: 'Sobremesa'),
            const SizedBox(
              height: 150,
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
