import 'package:cooking_agenda/view/add_receitas_page.dart';
import 'package:cooking_agenda/view/lista_receitas_page.dart';
import 'package:flutter/material.dart';

import 'view/detalhes_receitas.dart';
import 'view/config_page.dart';
import 'view/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashPage(),
        '/listaReceitas': (_) => const ListaReceitas(),
        '/adicionarReceitas': (_) => const AdicionarReceitas(),
        '/detalhesReceitas': (_) => const DetalhesReceitas(),
        '/config': (_) => const ConfigPage(),
      },
    );
  }
}
