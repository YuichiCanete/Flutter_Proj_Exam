import 'package:flutter/material.dart';
import 'package:flutter_application_10/pet_data.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class ShopScreen extends HookWidget {
  const ShopScreen({super.key});

  Widget newUpgrade({
    required String title,
    required String description,
    required IconData icon,
    required int cost,
    required callback,
  }) {
    return Container(
      width: 175,
      height: 175,
      margin: const EdgeInsets.all(10),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: Icon(
                  icon,
                  color: const Color(0xFF4CAF50),
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF4CAF50),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                  Icons.attach_money_rounded,
                  color: Color(0xFF4CAF50),
              ),
              Text(
                "$cost",
                style: const TextStyle(color: Color(0xFF4CAF50)),
              ),
            ],
          ),
          Text(
            description,
            style: const TextStyle(color: Color(0xFF4CAF50)),
          ),
          ElevatedButton.icon(
            onPressed: callback,
            label: const Text('Upgrade'),
            icon: const Icon(Icons.arrow_upward_rounded),
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
        const Text(
          'Shop',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.attach_money_rounded,
                  color: Color(0xFF4CAF50),
                ),
                Text(
                  "${petData.money}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4CAF50),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            newUpgrade(
              title: 'More Apples',
              icon: Icons.apple,
              description: '+ Food when eating',
              cost: petData.costFood,
              callback: petData.upgrade(toUpgrade: 'Food'),
            ),
            newUpgrade(
              title: 'Softer Bed',
              icon: Icons.airline_seat_individual_suite_rounded,
              description: '+ Energy when resting',
              cost: petData.costEnergy,
              callback: petData.upgrade(toUpgrade: 'Energy'),
            ),
            newUpgrade(
              title: 'Gaming Chair',
              icon: Icons.chair_rounded,
              description: '+ Fun when playing',
              cost: petData.costFun,
              callback: petData.upgrade(toUpgrade: 'Fun'),
            ),
            newUpgrade(
              title: 'MMMoney',
              icon: Icons.attach_money_rounded,
              description: '+ More money',
              cost: petData.costMoney,
              callback: petData.upgrade(toUpgrade: 'Money'),
            ),
          ],
        ),
      ],
    );
  }
}
