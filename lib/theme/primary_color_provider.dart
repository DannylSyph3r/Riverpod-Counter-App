import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ColorsNotifier extends StateNotifier<Map<String, Color>> {
  // Initialize the map of colors
  ColorsNotifier() : super({
    "Blue": Colors.blue,
    "Red": Colors.red,
    "Green": Colors.green,
    "Yellow": Colors.yellow,
    "Pink": Colors.pink,
    "Purple": Colors.purple,
    "Orange": Colors.orange,
  });

//Update Color with UI
  void updateColor(String colorName, Color newColor) {
    state = {...state, colorName: newColor};
  }
}

class SelectedColorNotifier extends StateNotifier<Color> {
  // Initialize the selected color
  SelectedColorNotifier() : super(const Color.fromARGB(255, 217, 0, 255));

  // Allow UI to change the selected color
  void changeColor(Color newColor) {
    state = newColor;
  }
}

final colorsProvider = StateNotifierProvider<ColorsNotifier, Map<String, Color>>((ref) {
  return ColorsNotifier();
});

final selectedColorProvider = StateNotifierProvider<SelectedColorNotifier, Color>((ref) {
  return SelectedColorNotifier();
});
