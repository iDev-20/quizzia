import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizzia/models/ui_models.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_strings.dart';
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
  List<QuizResult> _scoreHistory = [];
  bool _hasCompletedQuiz = false;

  String get amount => _amount ?? '5';
  String get category => _category ?? '';
  String get difficulty => _difficulty ?? 'easy';
  String get categoryName => _categoryName ?? 'Quiz';
  List<Question> get questions => _questions ?? [];
  int get currentQuestionIndex => _currentQuestionIndex;
  List<String> get userAnswers => _userAnswers;
  bool get isLoading => _isLoading;
  bool get hasQuestions => _questions != null && _questions!.isNotEmpty;
  List<QuizResult> get scoreHistory => List.unmodifiable(_scoreHistory);

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

  int get correctAnswersCount {
    if (!hasQuestions) return 0;

    int correctCount = 0;
    for (int i = 0; i < questions.length; i++) {
      if (i < _userAnswers.length &&
          _userAnswers[i] == _questions?[i].correctAnswer) {
        correctCount++;
      }
    }
    return correctCount;
  }

  int get totalQuestionsCount => _questions?.length ?? 0;

  double get percentage => totalQuestionsCount > 0
      ? (correctAnswersCount / totalQuestionsCount) * 100
      : 0.0;

  SvgPicture get resultIcon {
    if (percentage >= 80) return AppImages.svgExcellentResultIcon;
    if (percentage >= 50) return AppImages.svgVeryGoodResultIcon;
    return AppImages.svgFailedResultIcon;
  }

  String get resultText {
    if (percentage >= 80) return AppStrings.excellent;
    if (percentage >= 50) return AppStrings.veryGood;
    return AppStrings.youFailed;
  }

  Color get resultProgressColor {
    if (percentage >= 80) return AppColors.quizResultGreen;
    if (percentage >= 50) return AppColors.primaryColor;
    return AppColors.quizResultRed;
  }

  double get resultProgress => percentage / 100;

  List<QuestionResult>? get questionResults {
    if (!hasQuestions) return [];

    return _questions?.asMap().entries.map((e) {
      final index = e.key;
      final question = e.value;
      final userAnswer = index < _userAnswers.length ? _userAnswers[index] : '';

      return QuestionResult(
          question: question.question,
          userAnswer: userAnswer,
          isCorrect: userAnswer == question.correctAnswer);
    }).toList();
  }

  void resetQuiz() {
    _questions = null;
    _currentQuestionIndex = 0;
    _userAnswers = [];
    notifyListeners();
  }

  void addResult(QuizResult result) {
    _scoreHistory.insert(0, result);
    notifyListeners();
  }

  bool get completedQuiz => _hasCompletedQuiz;

  void markQuizCompleted() {
    _hasCompletedQuiz = true;
    notifyListeners();
  }
}
