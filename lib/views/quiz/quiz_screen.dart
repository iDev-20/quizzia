import 'package:flutter/material.dart';
import 'package:quizzia/resources/app_buttons.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_material.dart';
import 'package:quizzia/resources/app_page.dart';
import 'package:quizzia/resources/app_strings.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return AppPage(
      titleText: '${AppStrings.entertainment} Quiz',
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Question 1 of 10',
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '00:05:00',
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  LinearProgressIndicator(
                    value: 0.1,
                    minHeight: 8,
                    backgroundColor: AppColors.grey,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      'Francis Bacon died from a fatal case of pneumonia while he was attempting to preserve meat by stuffing a chicken with snow.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.black, fontSize: 16, height: 1.4),
                    ),
                  ),
                ],
              ),
            ),
            answerCard(
              option: 'a',
              answer: 'True',
              selected: false,
              onTap: () {},
            ),
            answerCard(
              option: 'b',
              answer: 'False',
              selected: true,
              onTap: () {},
            ),
            const SizedBox(height: 16),
            const CustomAppButton(
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  Widget answerCard({
    required String option,
    required String answer,
    required bool selected,
    required VoidCallback onTap,
  }) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '(${option.toUpperCase()})',
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  answer,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Visibility(
                visible: selected,
                replacement: AppImages.svgUnSelectedCircleCheckBox,
                child: AppImages.svgSelectedCircleCheckBox,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
