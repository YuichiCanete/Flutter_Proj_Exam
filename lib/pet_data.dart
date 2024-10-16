import 'package:flutter/foundation.dart'; // Ensure you import this

class PetData extends ChangeNotifier {
  int fun;
  int food;
  int energy;

  PetData({
    this.fun = 50,
    this.food = 50,
    this.energy = 50,
  });

  void feed() {
    if ((energy - 3) > 0) {
      food += 5;
      energy -= 3;
      notifyListeners();
    }
  }

  void play() {
    if ((energy - 3) > 0) {
      fun += 5;
      energy -= 3;
      notifyListeners();
    }
  }

  void rest() {
    if ((fun - 3) > 0) {
      energy += 5;
      fun -= 3;
      notifyListeners();
    }
  }
}
