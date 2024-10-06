import 'package:flutter/material.dart';

const smallText = TextStyle(
  fontSize: 16,
);
const titleText = TextStyle(fontSize: 32, fontWeight: FontWeight.bold);

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Text(
        'About Smiley Slimey',
        style: titleText,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 10),
      Text(
        'Smiley Slimey is a virtual pet game where you take care of a cute slime creature. \n'
        'Your goal is to keep your slime happy and healthy by managing its fun, food, and energy levels.',
        style: smallText,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20),
      Text(
        'Features',
        style: titleText,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 10,),
      Text(
        '- Feed your slime to keep it healthy\n'
        '- Play with your slime to increase its happiness\n'
        '- Let your slime rest when it gets tired\n'
        '- Buy upgrades in the shop\n',
        style: smallText,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Text(
        'Developed by: Yuichi Cañete\n',
        style: smallText,
        textAlign: TextAlign.center,
      ),
    ]);
  }
}
