import 'package:cook_book/provider/themes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
              Share.share(
                  'https://play.google.com/store/apps/details?id=com.bvflutterdev.cook_book');
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
}
