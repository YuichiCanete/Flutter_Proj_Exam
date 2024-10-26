import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PetData extends ChangeNotifier {
  int fun = 50;
  int food = 50;
  int energy = 50;
  int money = 0;

  int addMoney = 1;
  int addFun = 4;
  int addFood = 4;
  int addEnergy = 4;

  int costMoney = 25;
  int costFun = 15;
  int costEnergy = 15;
  int costFood = 15;

  Function upgrade({required String toUpgrade}) {
    return () {
      switch (toUpgrade) {
        case "Money":
          if (money >= costMoney) {
            money -= costMoney;
            addMoney += 1;
            costMoney += 10;
          }
          break;
        case "Fun":
          if (money >= costFun) {
            money -= costFun;
            addFun += 1;
            costFun += 10;
          }
          break;
        case "Food":
          if (money >= costFood) {
            money -= costFood;
            addFood += 1;
            costFood += 10;
          }
          break;
        case "Energy":
          if (money >= costEnergy) {
            money -= costEnergy;
            addEnergy += 1;
            costEnergy += 10;
          }
          break;
      }
      notifyListeners();
    };
  }

  void feed() {
    if ((fun - 3) > 0) {
      food += addFood;
      fun -= 3;
      money += addMoney;
      notifyListeners();
    }
  }

  void play() {
    if ((energy - 3) > 0) {
      fun += addFun;
      energy -= 3;
      money += addMoney;
      notifyListeners();
    }
  }

  void rest() {
    if ((food - 3) > 0) {
      energy += addEnergy;
      food -= 3;
      money += addMoney;
      notifyListeners();
    }
  }
}
