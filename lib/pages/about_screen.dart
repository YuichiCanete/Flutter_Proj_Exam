import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Text styles
const smallText = TextStyle(
  fontSize: 16,
);

const titleText = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
);

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Building text
    TextBuilder aboutDetails = TextBuilder()
      ..addText(text: 'About Smiley Slimey', textStyle: titleText)
      ..addSpace(10)
      ..addText(text: 'Smiley Slimey is a virtual pet game where you take care of a cute slime creature.')
      ..addText(text: 'Your goal is to keep your slime happy and healthy by managing its fun, food, and energy levels.')
      ..addSpace(20)
      ..addText(text: 'Features', textStyle: titleText)
      ..addSpace(10)
      ..addText(text: '- Feed your slime to keep it healthy')
      ..addText(text: '- Play with your slime to increase its happiness')
      ..addText(text: '- Let your slime rest when it gets tired')
      ..addText(text: '- Buy upgrades in the shop')
      ..addSpace(20)
      ..addText(text: 'Developed by: Yuichi Cañete')
      ..addSpace(20)
      ..addText(text: 'Follow Me:')
      ..addSpace(10)
      ..addSocialLinks();

    return Column(children: aboutDetails.build());
  }
}

// Builder
class TextBuilder {
  final List<Widget> widgets = [];

  void addText({required String text, TextStyle textStyle = smallText}) {
    widgets.add(Text(
      text,
      style: textStyle,
      textAlign: TextAlign.center,
    ));
  }

  void addSpace([double space = 20]) {
    widgets.add(SizedBox(
      height: space,
    ));
  }

  void addSocialLinks() {
    widgets.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSocialIcon(
            'assets/images/github.png',
            'https://github.com/YuichiCanete',
          ),
          _buildSocialIcon(
            'assets/images/fb.png',
            'https://www.facebook.com/yuichi.canete/',
          ),
          _buildSocialIcon(
            'assets/images/itchio.png',
            'https://bruhderboi.itch.io/',
          ),
          _buildSocialIcon(
            'assets/images/tiktok.png',
            'https://www.tiktok.com/@bruh.der',
          ),
          _buildSocialIcon(
            'assets/images/youtube.png',
            'https://www.youtube.com/@bruhder1572',
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(String assetPath, String url) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        try {
          if (await canLaunchUrl(uri)) {
            // Redirect
            await launchUrl(uri);
          } else {
            // Cant redirect
            throw 'Could not launch $url';
          }
        } catch (e) {
          // Error
          if (kDebugMode) {
            print('Error: $e');
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          assetPath,
          width: 40,
          height: 40,
        ),
      ),
    );
  }

  List<Widget> build() {
    return widgets;
  }
}
