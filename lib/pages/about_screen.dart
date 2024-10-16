import 'package:flutter/material.dart';

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
    TextBuilder aboutDetails = TextBuilder()
      ..addText(text: 'About Smilet Slimey', textStyle: titleText,)
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
    ;
    return Column(children: aboutDetails.build());
  }
}

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

  List<Widget> build(){
    return widgets;
  }
}
