import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 90,
            ),
            const Center(
              child: Text(
                'Receitas',
                style: TextStyle(fontSize: 45, shadows: [
                  Shadow(
                    offset: Offset(0, 4),
                    color: Colors.white,
                    blurRadius: 15,
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              height: 47,
              width: 380,
              child: const Text(
                ' Entradas',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 32),
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                shape: BoxShape.rectangle,
                color: Colors.deepPurple.shade50,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 47,
              width: 380,
              child: const Text(
                ' Entradas',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 32),
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                shape: BoxShape.rectangle,
                color: Colors.deepPurple.shade50,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 47,
              width: 380,
              child: const Text(
                ' Entradas',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 32),
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                shape: BoxShape.rectangle,
                color: Colors.deepPurple.shade50,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed('/addReceita');
                },
                icon: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                ),
                label: const Text(
                  'Adicionar Receita',
                  style: TextStyle(color: Colors.black),
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
                  color: Colors.black,
                ),
                label: const Text(
                  'Configurações',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
