import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_material.dart';
import 'package:quizzia/resources/app_strings.dart';

class QuizQuantityButton extends StatelessWidget {
  const QuizQuantityButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final SvgPicture icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppMaterial(
        inkwellBorderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Ink(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: icon),
      ),
    );
  }
}

class QuizQuantityWidget extends StatelessWidget {
  const QuizQuantityWidget({
    super.key,
    required this.quizQuantiity,
  });

  final int quizQuantiity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          quizQuantiity.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class QuizSizeSelector extends StatelessWidget {
  const QuizSizeSelector({
    super.key,
    required this.quizQuantity,
    required this.onDecrease,
    required this.onIncrease,
    required this.canDecrease,
    required this.canIncrease,
  });

  final int quizQuantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final bool canDecrease;
  final bool canIncrease;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppStrings.howManyQuestionsWouldYouLike,
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            QuizQuantityButton(
              icon: AppImages.svgMinusIcon,
              onTap: canDecrease ? onDecrease : () {},
            ),
            const SizedBox(width: 10),
            QuizQuantityWidget(quizQuantiity: quizQuantity),
            const SizedBox(width: 10),
            QuizQuantityButton(
              icon: AppImages.svgAddIcon,
              onTap: canIncrease ? onIncrease : () {},
            ),
          ],
        ),
      ],
    );
  }
}
