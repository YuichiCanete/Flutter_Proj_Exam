import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ShopScreen extends HookWidget {
  const ShopScreen({super.key});

  Widget upgradePet({required IconData icon, required String text}) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon),
        label: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Shop',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        upgradePet(
          icon: Icons.apple,
          text: "More Apples",
        ),
        upgradePet(
          icon: Icons.airline_seat_individual_suite_rounded,
          text: "Softer Bed",
        ),
        upgradePet(
          icon: Icons.chair_rounded,
          text: "Better Gaming Chair",
        ),
      ],
    );
  }
}
