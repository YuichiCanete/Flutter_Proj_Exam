import 'package:flutter/foundation.dart'; // Ensure you import this

class PetData extends ChangeNotifier {
  int fun;
  int food;
  int energy;

  PetData({this.fun = 100, this.food = 100, this.energy = 100});

  void feed() {
    food += 5;
    energy -= 3;
    notifyListeners();
  }

  void play() {
    fun += 5;
    energy -= 3;
    food -= 3;
    notifyListeners();
  }

  void rest() {
    energy += 5;
    food -= 3;
    fun -= 3;
    notifyListeners();
  }
}
