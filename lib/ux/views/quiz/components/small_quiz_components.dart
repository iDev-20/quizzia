import 'package:flutter/material.dart';
import 'package:quizzia/ux/shared/models/ui_models.dart';
import 'package:quizzia/ux/shared/resources/app_colors.dart';
import 'package:quizzia/ux/views/quiz/components/answer_card.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.primaryColor),
    );
  }
}

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: AppColors.black, size: 48),
          const SizedBox(height: 16),
          Text(
            'Error loading questions: $error',
            style: const TextStyle(color: AppColors.black, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No questions available',
        style: TextStyle(color: AppColors.black, fontSize: 16),
      ),
    );
  }
}

class QuestionText extends StatelessWidget {
  const QuestionText({super.key, required this.question});

  final String question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Text(
        question,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.black,
          fontSize: 16,
          height: 1.4,
        ),
      ),
    );
  }
}

class AnswersList extends StatelessWidget {
  const AnswersList({
    super.key,
    required this.question,
    required this.selectedAnswer,
    required this.onAnswerSelected,
  });

  final Question question;
  final String? selectedAnswer;
  final ValueChanged<String> onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: question.options.asMap().entries.map((entry) {
        final index = entry.key;
        final answer = entry.value.toString();
        final optionLetter = String.fromCharCode(97 + index); // a, b, c, d

        return AnswerCard(
          option: optionLetter,
          answer: answer,
          selected: selectedAnswer == answer,
          onTap: () => onAnswerSelected(answer),
        );
      }).toList(),
    );
  }
}
