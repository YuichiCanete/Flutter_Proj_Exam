import 'package:flutter/material.dart';
import 'package:flutter_application_10/pet_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GameScreen extends HookWidget {
  final String happySlime = '../assets/images/slime_happy.png';
  final String sadSlime = '../assets/images/slime_sad.png';
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final petData = Provider.of<PetData>(context);
    final slimeSprite = useState(happySlime);

    void checkStat() {
      if (petData.energy <= 25 || petData.food <= 25 || petData.fun <= 25) {
        slimeSprite.value = sadSlime;
      } else {
        slimeSprite.value = happySlime;
      }
    }

    Widget petAction({
      required IconData icon,
      required String actionText,
      required Function callback,
    }) {
      return Container(
        margin: const EdgeInsets.all(5),
        child: ElevatedButton.icon(
          onPressed: () {
            callback();
            checkStat();
          },
          icon: Icon(icon),
          label: Text(actionText),
        ),
      );
    }

    Widget iconStat({
      required IconData icon,
      required int data,
    }) {
      return Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              icon,
              color: data > 25 ? const Color(0xFF4CAF50) : Colors.red,
            ),
            Text(
              "$data",
              style: TextStyle(
                color: data > 25 ? const Color(0xFF4CAF50) : Colors.red,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Column(
          children: [
            IntrinsicWidth(
              child: Container(
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
                    iconStat(
                      icon: Icons.apple_rounded,
                      data: petData.food,
                    ),
                    iconStat(
                      icon: Icons.add_reaction_rounded,
                      data: petData.fun,
                    ),
                    iconStat(
                      icon: Icons.flash_on_rounded,
                      data: petData.energy,
                    ),
                    iconStat(
                      icon: Icons.attach_money_rounded,
                      data: petData.money,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 200,
          height: 200,
          margin: const EdgeInsets.all(10),
          child: Image.asset(slimeSprite.value),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            petAction(
              icon: Icons.apple_rounded,
              actionText: "Feed",
              callback: petData.feed,
            ),
            petAction(
              icon: Icons.add_reaction_rounded,
              actionText: "Play",
              callback: petData.play,
            ),
            petAction(
              icon: Icons.flash_on_rounded,
              actionText: "Rest",
              callback: petData.rest,
            ),
          ],
        )
      ],
    );
  }
}
