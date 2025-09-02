
import 'package:flutter/material.dart';
import 'package:quizzia/resources/app_colors.dart';

class QuizResultCard extends StatelessWidget {
  const QuizResultCard({
    super.key,
    required this.questionNumber,
    required this.question,
    required this.answer,
    required this.answerColor,
  });

  final int questionNumber;
  final String question;
  final String answer;
  final Color answerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.grey),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$questionNumber. ',
                style: const TextStyle(color: AppColors.black, height: 1.57),
              ),
              Expanded(
                child: Text(
                  question,
                  style: const TextStyle(color: AppColors.black, height: 1.57),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Answer: $answer',
            style: TextStyle(color: answerColor, height: 1.57),
          ),
        ],
      ),
    );
  }
}
