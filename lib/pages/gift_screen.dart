import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pet_data.dart';

class GiftScreen extends StatelessWidget {
  const GiftScreen({super.key});

  // Gift
  Widget giftWidget({
    required BuildContext context,
    required Color color,
    required String text,
    required String giftType,
    required int amount,
  }) {
    final petData = Provider.of<PetData>(context);
    final isClaimed = petData.giftsClaimed[text] ?? false;
    return Container(
      width: 150,
      height: 150,
      margin: const EdgeInsets.all(10),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.card_giftcard_rounded,
            size: 50,
            color: color,
          ),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton.icon(
            onPressed: isClaimed ? (){} : () {
              petData.claimGift(text, giftType, amount);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$text claimed! +$amount $giftType'),
                ),
              );
            },
            label: Text(isClaimed ? 'Claimed' : 'Open'),
            icon: const Icon(Icons.card_giftcard_rounded),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Mystery Gifts',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            giftWidget(
              context: context,
              color: Colors.red,
              text: 'Red Gift',
              giftType: 'Food',
              amount: 25,
            ),
            giftWidget(
              context: context,
              color: Colors.blue,
              text: 'Blue Gift',
              giftType: 'Energy',
              amount: 25,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            giftWidget(
              context: context,
              color: Colors.green,
              text: 'Green Gift',
              giftType: 'Fun',
              amount: 25,
            ),
            giftWidget(
              context: context,
              color: Colors.orange,
              text: 'Orange Gift',
              giftType: 'Money',
              amount: 15,
            ),
          ],
        ),
      ],
    );
  }
}
