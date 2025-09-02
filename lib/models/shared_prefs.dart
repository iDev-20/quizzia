import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const _firstTimeKey = 'isFirstTime';
  static const _quizQuantityPrefix = 'quiz_quantity_';

  static Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstTimeKey) ?? true;
  }

  static Future<void> setOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstTimeKey, false);
  }

  static Future<void> saveQuizQuantity(String category, int quantity) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('$_quizQuantityPrefix$category', quantity);
  }

  static Future<int> getQuizQuantity(String category) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('$_quizQuantityPrefix$category') ?? 5;
  }
}
