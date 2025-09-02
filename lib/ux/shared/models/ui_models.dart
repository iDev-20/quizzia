import 'package:flutter_svg/flutter_svg.dart';

class QuizCategory {
  final SvgPicture icon;
  final String text;
  final int categoryId;

  QuizCategory(
      {required this.icon, required this.text, required this.categoryId});
}

class Question {
  final String question;
  final List<dynamic> options;
  final String correctAnswer;
  final String category;
  final String difficulty;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.category,
    required this.difficulty,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    final allOptions = [
      ...List<dynamic>.from(json['incorrect_answers'] ?? []),
      json['correct_answer'] ?? ''
    ];

    return Question(
      question: json['question'] ?? '',
      options: allOptions..shuffle(),
      correctAnswer: json['correct_answer'] ?? '',
      category: json['category'] ?? '',
      difficulty: json['difficulty'] ?? '',
    );
  }
}

class QuestionResult {
  final String question;
  final String userAnswer;
  final bool isCorrect;

  QuestionResult(
      {required this.question,
      required this.userAnswer,
      required this.isCorrect});
}

class QuizResult {
  final String categoryName;
  final String difficulty;
  final int correctAnswersCount;
  final int totalQuestionsCount;
  final DateTime? date;
  final Duration? duration;

  QuizResult({
    required this.categoryName,
    required this.difficulty,
    required this.correctAnswersCount,
    required this.totalQuestionsCount,
    this.date,
    this.duration,
  });
}
