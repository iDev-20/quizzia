import 'package:flutter/material.dart';
import 'package:quizzia/models/ui_models.dart';
import 'package:quizzia/view_models/quiz_view_model.dart';

class QuizStateViewModel extends ChangeNotifier {
  String? _amount;
  String? _category;
  String? _difficulty;
  String? _categoryName;
  List<Question>? _questions;
  int _currentQuestionIndex = 0;
  List<String> _userAnswers = [];
  bool _isLoading = false;

  String get amount => _amount ?? '5';
  String get category => _category ?? '';
  String get difficulty => _difficulty ?? 'easy';
  String get categoryName => _categoryName ?? 'Quiz';
  List<Question> get questions => _questions ?? [];
  int get currentQuestionIndex => _currentQuestionIndex;
  List<String> get userAnswers => _userAnswers;
  bool get isLoading => _isLoading;
  bool get hasQuestions => _questions != null && _questions!.isNotEmpty;

  void setQuizSettings({
    required String amount,
    required String category,
    required String difficulty,
    String? categoryName,
  }) {
    _amount = amount;
    _category = category;
    _difficulty = difficulty;
    _categoryName = categoryName;
    notifyListeners();
  }

  Future<void> loadQuestions() async {
    if (_amount == null || _category == null || _difficulty == null) return;

    _isLoading = true;
    notifyListeners();

    try {
      final quizViewModel = QuizViewModel();
      _questions = await quizViewModel.getQuestions(
          amount: _amount ?? '',
          category: _category ?? '',
          difficulty: _difficulty ?? '');
      _currentQuestionIndex = 0;
      _userAnswers = List.filled(_questions?.length ?? 0, '');
    } catch (e) {
      _questions = [];
      debugPrint('Error loading questions: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < (_questions?.length ?? 0) - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  void setAnswer(String answer) {
    if (_currentQuestionIndex < _userAnswers.length) {
      _userAnswers[_currentQuestionIndex] = answer;
      notifyListeners();
    }
  }

  double get progress =>
      hasQuestions ? (_currentQuestionIndex + 1) / questions.length : 0.0;
}
