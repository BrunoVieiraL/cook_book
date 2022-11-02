import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/themes_provider.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> listTipoReceita = [
      'Entrada',
      'Prato Principal',
      'Sobremesa'
    ];
    final height = MediaQuery.of(context).size.height;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.14,
            ),
            Center(
              child: Text(
                'Receitas',
                style: TextStyle(
                  fontSize: 45,
                  shadows: [
                    Shadow(
                      offset: const Offset(0, 4),
                      color: themeProvider.isDark
                          ? Colors.white
                          : Colors.deepPurple.shade400,
                      blurRadius: 15,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.125,
            ),
            TapContainerTipoReceitaWidget(tipoReceita: listTipoReceita[0]),
            SizedBox(
              height: height * 0.017,
            ),
            TapContainerTipoReceitaWidget(tipoReceita: listTipoReceita[1]),
            SizedBox(
              height: height * 0.017,
            ),
            TapContainerTipoReceitaWidget(tipoReceita: listTipoReceita[2]),
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
