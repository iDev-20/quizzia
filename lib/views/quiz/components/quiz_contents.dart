import 'package:flutter/material.dart';
import 'package:quizzia/components/app_buttons.dart';
import 'package:quizzia/models/ui_models.dart';
import 'package:quizzia/views/quiz/components/quiz_header.dart';
import 'package:quizzia/views/quiz/components/small_quiz_components.dart';

class QuizContent extends StatelessWidget {
  const QuizContent({
    super.key,
    required this.question,
    required this.progress,
    required this.currentIndex,
    required this.totalQuestions,
    required this.selectedAnswer,
    required this.onAnswerSelected,
    required this.onNext,
    required this.hasSelectedAnswer,
  });

  final Question question;
  final double progress;
  final int currentIndex;
  final int totalQuestions;
  final String? selectedAnswer;
  final ValueChanged<String> onAnswerSelected;
  final VoidCallback onNext;
  final bool hasSelectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuizHeader(
                currentIndex: currentIndex,
                totalQuestions: totalQuestions,
                progress: progress,
              ),
              QuestionText(question: question.question),
            ],
          ),
        ),
        AnswersList(
          question: question,
          selectedAnswer: selectedAnswer,
          onAnswerSelected: onAnswerSelected,
        ),
        const SizedBox(height: 16),
        CustomAppButton(
          onTap: hasSelectedAnswer ? onNext : null,
          child: const Text('Next'),
        ),
      ],
    );
  }
}
