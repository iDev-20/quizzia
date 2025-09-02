import 'package:flutter/material.dart';
import 'package:quizzia/components/app_buttons.dart';
import 'package:quizzia/navigation/navigation.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_strings.dart';

class QuizResultState extends StatelessWidget {
  const QuizResultState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppImages.svgVeryGoodResultIcon,
          const SizedBox(height: 56),
          const Text(
            AppStrings.veryGood,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 18),
          const Text(
            'You scored 60%',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: LinearProgressIndicator(
              value: 0.1,
              minHeight: 8,
              backgroundColor: AppColors.grey,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 64),
          CustomAppButton(
            onTap: () {
              Navigation.navigateToHomePage(context: context);
            },
            child: const Text('Go Home'),
          ),
          const SizedBox(height: 10),
          CustomAppOutlinedButton(
            onTap: () {},
            child: const Text('See Result'),
          ),
        ],
      ),
    );
  }
}
