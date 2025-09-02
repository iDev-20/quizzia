import 'package:flutter/material.dart';
import 'package:quizzia/ux/shared/resources/app_colors.dart';
import 'package:quizzia/ux/shared/resources/app_images.dart';
import 'package:quizzia/ux/shared/resources/app_strings.dart';

class ScoreHistoryEmptyStateDetails extends StatelessWidget {
  const ScoreHistoryEmptyStateDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppImages.svgClipboardIcon,
        const SizedBox(height: 10),
        const Text(
          AppStrings.youHaveNoScoresRecordedYet,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.grey200, height: 1.5),
        ),
      ],
    );
  }
}
