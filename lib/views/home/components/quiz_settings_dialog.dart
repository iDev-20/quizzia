import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizzia/navigation/navigation.dart';
import 'package:quizzia/resources/app_buttons.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_dropdown_field.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_material.dart';
import 'package:quizzia/resources/app_strings.dart';

class QuizSettingsDialog extends StatefulWidget {
  const QuizSettingsDialog({super.key});

  @override
  State<QuizSettingsDialog> createState() => _QuizSettingsDialogState();
}

class _QuizSettingsDialogState extends State<QuizSettingsDialog> {
  List<String> difficulties = [
    AppStrings.easy,
    AppStrings.medium,
    AppStrings.hard
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  AppStrings.quizSettings,
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                AppMaterial(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      Navigation.back(context: context);
                    },
                    child: AppImages.svgCloseIcon)
              ],
            ),
            const SizedBox(height: 26),
            selectQuizSize(),
            const SizedBox(height: 30),
            CustomAppDropDownField(
              labelText: AppStrings.selectDifficulty,
              stringItems: true,
              items: difficulties,
              onChanged: (p0) {
                setState(() {});
              },
            ),
            const SizedBox(height: 58),
            CustomAppButton(
              onTap: () {},
              child: const Text(AppStrings.startQuiz),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectQuizSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppStrings.howManyQuestionsWouldYouLike,
          style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            quantityButton(icon: AppImages.svgMinusIcon, onTap: () {}),
            const SizedBox(width: 10),
            quantity(),
            const SizedBox(width: 10),
            quantityButton(icon: AppImages.svgAddIcon, onTap: () {}),
          ],
        ),
      ],
    );
  }

  Widget quantityButton(
      {required SvgPicture icon, required VoidCallback onTap}) {
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

  Widget quantity() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          '5',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
