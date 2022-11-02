import 'package:cook_book/provider/themes_provider.dart';
import 'package:cook_book/views/splash_page.dart';
import 'package:cook_book/views/views.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'themes/custom_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          themeMode: provider.darkTheme ? ThemeMode.dark : ThemeMode.light,
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: '/splashPage',
          routes: {
            '/splashPage': (_) => const SplashPage(),
            '/homePage': (_) => const HomePage(),
            '/listaReceitas': (_) => const ListaReceitas(
                  tipoReceita: '',
                ),
            '/addReceita': (_) => const AddReceitaPage(),
            '/configPage': (_) => const ConfigPage(),
            '/infoPage': (_) => const InfoPage(),
          },
        );
      },
    );
  }
}
