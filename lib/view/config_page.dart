import 'package:cooking_agenda/provider/themes_provider.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: Column(
        children: [
          const SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Importar'),
              GestureDetector(
                child: const Icon(Icons.arrow_downward),
                onTap: () {
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Deseja Salvar a Receita?'),
                      actions: [
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('Sim'),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('Não'),
                        ),
                      ],
                      elevation: 24,
                      backgroundColor: const Color(0xFFD1C3DC),
                    ),
                  );
                },
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Alterar Tema'),
              Switch.adaptive(
                  activeColor: Colors.black,
                  activeTrackColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.black,
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    final provider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    provider.toggleTheme(value);
                  }),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Informações'),
              GestureDetector(
                child: const Icon(Icons.info),
                onTap: () {
                  Navigator.of(context).pushNamed('/infoPage');
                },
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Compartilhar app'),
              GestureDetector(
                child: const Icon(Icons.share),
                onTap: () {},
              ),
            ],
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
