import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../widgets/card_social_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class CardDeveloperComponent extends StatelessWidget {
  final String role;
  final String fullName;

  const CardDeveloperComponent({
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
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                fullName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: height * 0.023,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/brunovieira.png'),
                radius: 30,
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.0156,
        ),
        CardSocialWidget(
          text: 'BrunoVieiraL',
          iconPath: 'assets/github.png',
          urlPath: () async {
            String urlGitHub = 'https://github.com/BrunoVieiraL';
            await launchUrl(Uri.parse(urlGitHub),
                mode: LaunchMode.externalApplication);
          },
        ),
        CardSocialWidget(
          text: 'Bruno Vieira',
          iconPath: 'assets/linkedin.png',
          urlPath: () async {
            String urlLinkedin =
                'https://www.linkedin.com/in/bruno-vieira-818976191/';
            await launchUrlString(urlLinkedin,
                mode: LaunchMode.externalApplication);
          },
        ),
        // CardSocialWidget(
        //   text: 'brunoleo.vieira516@gmail.com',
        //   iconPath: 'assets/gmail.png',
        //   urlPath: () async {
        //     String email = 'brunoleo.vieira516@gmail.com';
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
      ],
    );
  }
}
