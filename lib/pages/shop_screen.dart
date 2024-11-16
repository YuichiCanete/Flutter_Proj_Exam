import 'package:flutter/material.dart';
import 'package:flutter_application_10/pet_data.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class ShopScreen extends HookWidget {
  const ShopScreen({super.key});

  // Upgrade
  Widget newUpgrade({
    required String title,
    required String description,
    required IconData icon,
    required int cost,
    required callback,
  }) {
    return Container(
      width: 250,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: 40,
            color: const Color(0xFF4CAF50),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(3),
                child: Text(
                  '$title -\$$cost',
                  style: const TextStyle(
                    color: Color(0xFF4CAF50),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: ElevatedButton.icon(
              onPressed: callback,
              label: Text(description),
              icon: const Icon(Icons.arrow_upward_rounded),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final petData = Provider.of<PetData>(context);
    return Column(
      children: [
        // Shop text
        const Text(
          'Shop',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),

        // Display Money
        IntrinsicWidth(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8.0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              "\$${petData.money}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF4CAF50),
              ),
            ),
          ),
        ),

        // List of Upgrades
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            newUpgrade(
              title: 'More Apples',
              icon: Icons.apple,
              description: 'Upgrade Food',
              cost: petData.costFood,
              callback: petData.upgrade(toUpgrade: 'Food'),
            ),
            newUpgrade(
              title: 'Softer Bed',
              icon: Icons.airline_seat_individual_suite_rounded,
              description: 'Upgrade Rest',
              cost: petData.costEnergy,
              callback: petData.upgrade(toUpgrade: 'Energy'),
            ),
            newUpgrade(
              title: 'Gaming Chair',
              icon: Icons.chair_rounded,
              description: 'Upgrade Play',
              cost: petData.costFun,
              callback: petData.upgrade(toUpgrade: 'Fun'),
            ),
            newUpgrade(
              title: 'MMMoney',
              icon: Icons.attach_money_rounded,
              description: 'Upgrade Money',
              cost: petData.costMoney,
              callback: petData.upgrade(toUpgrade: 'Money'),
            ),
          ],
        ),
        
      ],
    );
  }
}
