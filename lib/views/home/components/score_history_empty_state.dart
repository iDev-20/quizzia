import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/views/home/components/score_details_empty_state_details.dart';

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
      child: const ScoreHistoryEmptyStateDetails(),
    );
  }
}
