import 'package:flutter/material.dart';

import '../components/card_role_designer_component.dart';
import '../components/card_role_dev_component.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações'),
        backgroundColor: const Color(0xFF935EB0),
      ),
      body: Container(
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CardDeveloperRoleComponent(
              role: 'Developer',
              fullName: 'Bruno Vieira',
            ),
            CardDeseignerRoleComponent(
              role: 'Designer UI/UX',
              fullName: 'Thays Lobato',
            ),
          ],
        ),
      ),
    );
  }
}
