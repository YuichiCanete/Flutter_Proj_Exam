import 'package:flutter/material.dart';
import 'package:flutter_application_10/pet_data.dart';
import 'package:flutter_application_10/pet_dialogue.dart';
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
    final petDialogue = useState('Hello There!');
    final dialogueCol = useState(const Color(0xFF4CAF50));
    final dialogueClass = PetDialogue();

    void checkStat() {
      if (petData.energy <= 25 || petData.food <= 25 || petData.fun <= 25) {
        slimeSprite.value = sadSlime;
      } else {
        slimeSprite.value = happySlime;
      }
    }

    void changePetName(BuildContext context) {
      final petNameController = TextEditingController(text: petData.petName);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Change Pet Name"),
            content: TextField(
              controller: petNameController,
              decoration: const InputDecoration(
                labelText: 'Enter new name',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  petData.setPetName(petNameController.text);
                  Navigator.of(context).pop();
                },
                child: const Text('Save'),
              ),
            ],
          );
        },
      );
    }

    Widget petAction({
      required IconData icon,
      required String action,
    }) {
      return Container(
        margin: const EdgeInsets.all(5),
        child: ElevatedButton.icon(
          onPressed: () {
            bool canPerform = petData.action(toAct: action);
            petDialogue.value = dialogueClass.getRandomDialogue(
              action: action,
              canPerform: canPerform,
            );
            dialogueCol.value =
                canPerform ? const Color(0xFF4CAF50) : Colors.red;
            checkStat();
          },
          icon: Icon(icon),
          label: Text(action),
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
        GestureDetector(
          onTap: () => changePetName(context),
          child: IntrinsicWidth(
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
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
                children: [
                  const Icon(
                    Icons.edit_rounded, // Pencil icon
                    color: Color(0xFF4CAF50), // Green color
                  ),
                  const SizedBox(width: 10), // Space between icon and text
                  Text(
                    petData.petName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
          margin: const EdgeInsets.all(5),
          child: Image.asset(slimeSprite.value),
        ),
        Container(
          margin: const EdgeInsets.all(5),
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
            petDialogue.value,
            style: TextStyle(
              color: dialogueCol.value,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            petAction(
              icon: Icons.apple_rounded,
              action: "Feed",
            ),
            petAction(
              icon: Icons.add_reaction_rounded,
              action: "Play",
            ),
            petAction(
              icon: Icons.flash_on_rounded,
              action: "Rest",
            ),
          ],
        )
      ],
    );
  }
}
