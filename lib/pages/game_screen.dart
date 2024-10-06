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

    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Icon(Icons.apple_rounded),
                      Text("${petData.food}"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Icon(Icons.add_reaction_rounded),
                      Text("${petData.fun}"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Icon(Icons.flash_on_rounded),
                      Text("${petData.energy}"),
                    ],
                  ),
                ),
              ],
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
            Container(
              margin: const EdgeInsets.all(5),
              child: ElevatedButton.icon(
                onPressed: () {
                  petData.feed();
                  checkStat();
                },
                icon: const Icon(Icons.apple_rounded),
                label: const Text("Feed"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: ElevatedButton.icon(
                onPressed: () {
                  petData.play();
                  checkStat();
                },
                icon: const Icon(Icons.add_reaction_rounded),
                label: const Text("Play"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: ElevatedButton.icon(
                onPressed: () {
                  petData.rest();
                  checkStat();
                },
                icon: const Icon(Icons.flash_on_rounded),
                label: const Text('Rest'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
