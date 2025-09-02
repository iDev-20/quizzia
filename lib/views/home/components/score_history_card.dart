import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizzia/models/ui_models.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_strings.dart';

class ScoreHistoryCard extends StatelessWidget {
  const ScoreHistoryCard({super.key, required this.result});

  final QuizResult result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Column(
          children: [
            box(
              boxColor: AppColors.primary100,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        result.categoryName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        AppStrings.sampleQuizTime,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    result.difficulty,
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            box(
              boxColor: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconBox(icon: AppImages.svgClockIcon),
                  const Expanded(
                    child: Text(
                      AppStrings.sampleQuizDuration,
                      style: TextStyle(
                          color: AppColors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
                  iconBox(icon: AppImages.svgFlagIcon),
                  Text(
                    '${result.correctAnswersCount} of ${result.totalQuestionsCount}',
                    style: const TextStyle(
                        color: AppColors.green, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget box(
      {required Color boxColor,
      required EdgeInsetsGeometry padding,
      required BorderRadius borderRadius,
      required Widget child}) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }

  Widget iconBox({required SvgPicture icon}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.primary50,
          borderRadius: BorderRadius.circular(4),
        ),
        child: icon,
      ),
    );
  }
}
