import 'package:flutter/material.dart';

import '../widgets/card_social_widget.dart';

class CardDeseignerRoleComponent extends StatelessWidget {
  final String role;
  final String fullName;

  const CardDeseignerRoleComponent({
    Key? key,
    required this.role,
    required this.fullName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  role + ': ',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  fullName,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 15,
                ),
                const CircleAvatar(
                  radius: 30,
                  child: Image(image: AssetImage('assets/instagram.png')),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const CardSocialWidget(
              text: 'githublink',
              iconPath: 'assets/behance.png',
            ),
            const CardSocialWidget(
              text: 'text',
              iconPath: 'assets/linkedin.png',
            ),
            const CardSocialWidget(
              text: 'text',
              iconPath: 'assets/gmail.png',
            ),
            const CardSocialWidget(
              text: 'text',
              iconPath: 'assets/instagram.png',
            )
          ],
        ),
      ),
    );
  }
}
