import 'package:flutter/material.dart';
import 'package:quizzia/resources/app_strings.dart';

class QuizDifficultyViewModel extends ChangeNotifier {
  List<String> difficulties = [
    AppStrings.easy,
    AppStrings.medium,
    AppStrings.hard
  ];

  static const String defaultDifficulty = AppStrings.easy;

  String _selectedDifficulty = defaultDifficulty;
  String get selectedDifficulty => _selectedDifficulty;

  void setDifficulty(String difficulty) {
    _selectedDifficulty = difficulty;
    notifyListeners();
  }
}
