import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorsNotifier extends StateNotifier<Map<String, Color>> {
  ColorsNotifier() : super({
    "Blue": const Color.fromARGB(255, 0, 140, 255),
    "Red": const Color.fromARGB(255, 255, 17, 0),
    "Green": const Color.fromARGB(255, 0, 255, 8),
    "Yellow": const Color.fromARGB(255, 255, 230, 0),
    "Pink": const Color.fromARGB(255, 255, 68, 130),
    "Purple": const Color.fromARGB(255, 217, 0, 255),
    "Orange": const Color.fromARGB(255, 255, 153, 0),
  });

  void updateColor(String colorName, Color newColor) {
    state = {...state, colorName: newColor};
  }
}

class SelectedColorNotifier extends StateNotifier<Color> {
  SelectedColorNotifier() : super(const Color.fromARGB(255, 217, 0, 255));

  Future<void> changeColor(Color newColor) async {
    state = newColor;
    await saveSelectedColor(newColor);
  }

  Future<void> saveSelectedColor(Color selectedColor) async {
    final prefs = await SharedPreferences.getInstance();
    final selectedColorValue = selectedColor.value.toString();
    await prefs.setString('selectedColor', selectedColorValue);
  }

  Future<void> getSavedColor() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedColorValue = prefs.getString('selectedColor');
    if (selectedColorValue != null) {
      final selectedColor = Color(int.parse(selectedColorValue));
      state = selectedColor;
    }
  }
}

final colorsProvider = StateNotifierProvider<ColorsNotifier, Map<String, Color>>((ref) {
  return ColorsNotifier();
});

final selectedColorProvider = StateNotifierProvider<SelectedColorNotifier, Color>((ref) {
  final selectedColorNotifier = SelectedColorNotifier();
  selectedColorNotifier.getSavedColor();
  return selectedColorNotifier;
});
