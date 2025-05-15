import 'package:flutter/material.dart';

import '../components/components.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.035,
          ),
          const CardDeveloperComponent(
            role: 'Mobile Developer',
            fullName: 'Bruno Vieira',
          ),
          SizedBox(
            height: height * 0.028,
          ),
          const CardDeseignerComponent(
            role: 'Designer UI/UX',
            fullName: 'Thays Lobato',
          ),
        ],
      ),
    );
  }
}
