import 'package:flutter/material.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_material.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.option,
    required this.answer,
    required this.selected,
    required this.onTap,
  });

  final String option;
  final String answer;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: AppMaterial(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(8),
        inkwellBorderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text(
                '(${option.toUpperCase()})',
                style: const TextStyle(color: AppColors.black, fontSize: 16),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  answer,
                  style: const TextStyle(color: AppColors.black, fontSize: 16),
                ),
              ),
              const SizedBox(width: 10),
              selected
                  ? AppImages.svgSelectedCircleCheckBox
                  : AppImages.svgUnSelectedCircleCheckBox,
            ],
          ),
        ),
      ),
    );
  }
}
