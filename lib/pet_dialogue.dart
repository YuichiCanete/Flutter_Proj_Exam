import 'dart:math';

class PetDialogue {
  final List<String> feedDialogues = [
    "Yum! That was delicious!",
    "I'm full now, thanks!",
    "Can I have some more?",
    "Food makes me happy!",
    "You really know my favorite food!"
  ];

  final List<String> playDialogues = [
    "Woohoo! So much fun!",
    "I love playing with you!",
    "Let's do this again!",
    "I'm having the best time!",
    "You're the best playmate!"
  ];

  final List<String> restDialogues = [
    "Zzz... That was refreshing!",
    "Ah, now I feel so energetic!",
    "Thanks, I needed that nap!",
    "Back to full power!",
    "That nap hit the spot!"
  ];

  // Opposite dialogues when action cannot be performed
  final List<String> cannotFeedDialogues = [
    "I'm too full to eat more!",
    "No thanks, I can't eat another bite!",
    "Maybe later, I'm not hungry.",
    "I've had enough food for now!"
  ];

  final List<String> cannotPlayDialogues = [
    "I'm too tired to play right now.",
    "Let's rest first, then we can play!",
    "I'm all out of energy for playing.",
    "Maybe later, I need a break."
  ];

  final List<String> cannotRestDialogues = [
    "I'm not tired at all!",
    "Let's do something else, I'm full of energy!",
    "I don't feel like resting now.",
    "I'm ready for action, not sleep!"
  ];

  // Method to fetch a random dialogue based on action type and availability
  String getRandomDialogue({required String action, required bool canPerform}) {
    final random = Random();
    if (canPerform) {
      switch (action) {
        case "Feed":
          return feedDialogues[random.nextInt(feedDialogues.length)];
        case "Play":
          return playDialogues[random.nextInt(playDialogues.length)];
        case "Rest":
          return restDialogues[random.nextInt(restDialogues.length)];
      }
    } else {
      switch (action) {
        case "Feed":
          return cannotFeedDialogues[random.nextInt(cannotFeedDialogues.length)];
        case "Play":
          return cannotPlayDialogues[random.nextInt(cannotPlayDialogues.length)];
        case "Rest":
          return cannotRestDialogues[random.nextInt(cannotRestDialogues.length)];
      }
    }
    return "I'm not sure what to say!";
  }
}
