import 'package:flutter/foundation.dart'; // Ensure you import this

class PetData extends ChangeNotifier {
  int fun;
  int food;
  int energy;

  PetData({this.fun = 75, this.food = 75, this.energy = 75});

  void feed() {
    if ((energy - 3) > 0){
      food += 5;
      energy -= 3;
      notifyListeners();
    }
  }

  void play() {
    if ((energy - 3) > 0 && (food - 3) > 0) {
      fun += 5;
      energy -= 3;
      food -= 3;
      notifyListeners();
    }
  }

  void rest() {
    if ((food - 3) > 0 && (fun - 3) > 0){
      energy += 5;
      food -= 3;
      fun -= 3;
      notifyListeners();
    }
  }
}
