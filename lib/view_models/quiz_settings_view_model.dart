import 'package:flutter/material.dart';
import 'package:quizzia/models/shared_prefs.dart';
import 'package:quizzia/resources/app_strings.dart';

class QuizSettingsViewModel extends ChangeNotifier {
  final List<String> difficulties = [
    AppStrings.easy,
    AppStrings.medium,
    AppStrings.hard
  ];

  String selectedDifficulty = AppStrings.easy;
  int _quizQuantity = 5;
  String? _currentCategory;
  bool isInitialized = false;

  bool get canDecrease => quizQuantity > 1;
  bool get canIncrease => quizQuantity < 20;

  int get quizQuantity {
    return _quizQuantity;
  }

  Future<void> ensureInitialized(String category) async {
    if (_currentCategory == category && isInitialized) {
      return;
    }

    _currentCategory = category;
    await loadPreviousSettings();
    isInitialized = true;
  }

  Future<void> loadPreviousSettings() async {
    if (_currentCategory == null) return;

    try {
      final savedQuantity =
          await SharedPrefs.getQuizQuantity(_currentCategory ?? '');
      _quizQuantity = savedQuantity;

      notifyListeners();
    } catch (e) {
      notifyListeners();
      debugPrint('Error loading quiz settings: $e');
    }
  }

  void setDifficulty(String difficulty) {
    selectedDifficulty = difficulty;
    notifyListeners();
  }

  Future<void> increaseQuantity(String category) async {
    await ensureInitialized(category);
    if (canIncrease) {
      _quizQuantity++;
      notifyListeners();
      await saveQuantitySettings();
    }
  }

  Future<void> decreaseQuantity(String category) async {
    await ensureInitialized(category);
    if (canDecrease) {
      _quizQuantity--;
      notifyListeners();
      await saveQuantitySettings();
    }
  }

  Future<void> setQuantity(int quantity) async {
    if (quantity > 0) {
      _quizQuantity = quantity;
      notifyListeners();
      await saveQuantitySettings();
    }
  }

  Future<Map<String, dynamic>> getSettingsForCategory(String category) async {
    await ensureInitialized(category);
    return {
      'category': category,
      'difficulty': selectedDifficulty,
      'quantity': _quizQuantity,
    };
  }

  Future<void> saveQuantitySettings() async {
    if (_currentCategory == null) return;

    try {
      await SharedPrefs.saveQuizQuantity(_currentCategory ?? '', quizQuantity);
    } catch (e) {
      debugPrint('Error saving quiz quantity: $e');
    }
  }

  void resetToDefaults() {
    isInitialized = false;
    _currentCategory = null;
    _quizQuantity = 5;
    selectedDifficulty = AppStrings.easy;
    notifyListeners();
  }
}
