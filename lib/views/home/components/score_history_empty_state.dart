import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_strings.dart';

class ScoreHistoryEmptyState extends StatelessWidget {
  const ScoreHistoryEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.dottedBorderColor,
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      dashPattern: const [8, 8],
      padding: const EdgeInsets.symmetric(horizontal: 66, vertical: 59),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppImages.svgClipboardIcon,
          const SizedBox(height: 10),
          const Text(
            AppStrings.youHaveNoScoresRecordedYet,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.grey200, height: 1.5),
          ),
        ],
      ),
    );
  }
}
