import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../widgets/card_social_widget.dart';

class CardDeseignerComponent extends StatelessWidget {
  final String role;
  final String fullName;

  const CardDeseignerComponent({
    Key? key,
    required this.role,
    required this.fullName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                role + ': ',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              Text(
                fullName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 15,
              ),
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/thayslobato.png'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.015,
        ),
        CardSocialWidget(
          text: 'Thays Lobato',
          iconPath: 'assets/behance.png',
          urlPath: () async {
            String urlBehance = 'https://www.behance.net/thayslobato';
            await launchUrlString(urlBehance, mode: LaunchMode.externalApplication);
          },
        ),
        CardSocialWidget(
          text: 'Thays Lobato',
          iconPath: 'assets/linkedin.png',
          urlPath: () async {
            String urlLinkedin =
                'https://www.linkedin.com/in/thays-lobato-35b9161b0/';
            await launchUrlString(urlLinkedin, mode: LaunchMode.externalApplication);
          },
        ),
        // CardSocialWidget(
        //   text: 'thayslobato2@gmail.com',
        //   iconPath: 'assets/gmail.png',
        //   urlPath: () async {
        //     String email = 'thayslobato2@gmail.com';
        //     String assunto = '';
        //     String body = '';

        //     String? encodeQueryParameters(Map<String, String> params) {
        //       return params.entries
        //           .map((MapEntry<String, String> element) =>
        //               '${Uri.encodeComponent(element.key)}=${Uri.encodeComponent(element.value)}')
        //           .join('&');
        //     }

        //     final Uri emailUri = Uri(
        //       scheme: 'mailto',
        //       path: email,
        //       query: encodeQueryParameters(<String, String>{
        //         'assunto': assunto,
        //         'body': body,
        //       }),
        //     );
        //     await launchUrlString(emailUri.toString());
        //   },
        // ),
        CardSocialWidget(
          text: 'TL Designer Gráfico',
          iconPath: 'assets/instagram.png',
          urlPath: () async {
            String urlInstagram =
                'https://www.instagram.com/tldesigner.grafico/';
            await launchUrlString(urlInstagram, mode: LaunchMode.externalApplication);
          },
        )
      ],
    );
  }
}
