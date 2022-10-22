import 'package:cook_book/provider/themes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.043,
          ),
          GestureDetector(
            onTap: () {
              emConstrucao();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Importar',
                  style: TextStyle(fontSize: 25),
                ),
                Icon(
                  Icons.arrow_downward,
                  size: 28,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Consumer<ThemeProvider>(
            builder: (context, provider, child) => GestureDetector(
              onTap: () {
                provider.toggleTheme();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Alterar Tema',
                    style: TextStyle(fontSize: 25),
                  ),
                  Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      activeColor: Colors.black,
                      activeTrackColor: Colors.white,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.black,
                      value: themeProvider.isDark,
                      onChanged: (value) {
                        provider.toggleTheme();
                      }),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/infoPage');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Informações',
                  style: TextStyle(fontSize: 25),
                ),
                Icon(
                  Icons.info,
                  size: 28,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          GestureDetector(
            onTap: () {
              emConstrucao();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Compartilhar app',
                  style: TextStyle(fontSize: 25),
                ),
                Icon(
                  Icons.share,
                  size: 28,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  emConstrucao() {
    return ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Em construção')));
  }
}
