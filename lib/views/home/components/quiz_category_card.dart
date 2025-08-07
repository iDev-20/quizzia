import 'package:flutter/material.dart';
import 'package:quizzia/models/ui_models.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_material.dart';

class QuizCategoryCard extends StatelessWidget {
  const QuizCategoryCard({
    super.key,
    required this.quizCategory,
  });

  final QuizCategory quizCategory;

  @override
  Widget build(BuildContext context) {
    return AppMaterial(
      color: AppColors.primary50,
      borderRadius: BorderRadius.circular(16),
      inkwellBorderRadius: BorderRadius.circular(16),
      child: Ink(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            quizCategory.icon,
            const SizedBox(height: 10),
            Text(
              quizCategory.text,
              style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
