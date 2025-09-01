import 'package:flutter/material.dart';
import 'package:quizzia/resources/app_colors.dart';

class QuizHeader extends StatelessWidget {
  const QuizHeader({
    super.key,
    required this.currentIndex,
    required this.totalQuestions,
    required this.progress,
  });

  final int currentIndex;
  final int totalQuestions;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Question ${currentIndex + 1} of $totalQuestions',
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              '00:05:00',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        LinearProgressIndicator(
          value: progress,
          minHeight: 8,
          backgroundColor: AppColors.grey,
          valueColor:
              const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
