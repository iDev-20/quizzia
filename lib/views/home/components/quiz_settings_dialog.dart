// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quizzia/models/shared_prefs.dart';
import 'package:quizzia/navigation/navigation.dart';
import 'package:quizzia/resources/app_buttons.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_dropdown_field.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_material.dart';
import 'package:quizzia/resources/app_strings.dart';
import 'package:quizzia/view_models/quiz_difficulty_view_model.dart';

class QuizSettingsDialog extends StatefulWidget {
  const QuizSettingsDialog({super.key, required this.category});

  final String category;

  @override
  State<QuizSettingsDialog> createState() => _QuizSettingsDialogState();
}

class _QuizSettingsDialogState extends State<QuizSettingsDialog> {
  @override
  void initState() {
    super.initState();
    loadPreviousSettings();
  }

  int quizQuantiity = 5;

  Future<void> loadPreviousSettings() async {
    try {
      int savedQuantity = await SharedPrefs.getQuizQuantity(widget.category);

      if (mounted) {
        setState(() {
          quizQuantiity = savedQuantity;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveQuizQuantitySettings() async {
    await SharedPrefs.saveQuizQuantity(widget.category, quizQuantiity);
  }

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
            Consumer<QuizDifficultyViewModel>(
              builder: (context, quizDifficultyViewModel, child) {
                return CustomAppDropDownField(
                  labelText: AppStrings.selectDifficulty,
                  stringItems: true,
                  items: quizDifficultyViewModel.difficulties,
                  valueHolder: quizDifficultyViewModel.selectedDifficulty,
                  onChanged: (selectedDifficulty) {
                    if (selectedDifficulty != null) {
                      quizDifficultyViewModel.setDifficulty(selectedDifficulty);
                    }
                  },
                );
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
            quantityButton(
              icon: AppImages.svgMinusIcon,
              onTap: () {
                if (quizQuantiity > 1) {
                  setState(() {
                    quizQuantiity--;
                  });
                  saveQuizQuantitySettings();
                }
              },
            ),
            const SizedBox(width: 10),
            quantity(),
            const SizedBox(width: 10),
            quantityButton(
              icon: AppImages.svgAddIcon,
              onTap: () {
                setState(() {
                  quizQuantiity++;
                });
                saveQuizQuantitySettings();
              },
            ),
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
