import 'package:flutter/material.dart';

import '../components/components.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações'),
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 25,
          ),
          CardDeveloperComponent(
            role: 'Developer',
            fullName: 'Bruno Vieira',
          ),
          SizedBox(
            height: 50,
          ),
          CardDeseignerComponent(
            role: 'Designer UI/UX',
            fullName: 'Thays Lobato',
          ),
        ],
      ),
    );
  }
}
