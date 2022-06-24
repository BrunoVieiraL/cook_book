import 'package:cooking_agenda/view/lista_receitas_page.dart';
import 'package:flutter/material.dart';

import 'view/config_page.dart';
import 'view/splash_page.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
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
        '/config': (_) => const ConfigPage(),
      },
    );
  }
}
