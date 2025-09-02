import 'package:flutter/material.dart';
import 'package:quizzia/components/app_page.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_strings.dart';
import 'package:quizzia/views/quiz/components/quiz_result_card.dart';

class QuizAnswersScreen extends StatelessWidget {
  const QuizAnswersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      titleText: AppStrings.quizResult,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return QuizResultCard(
              questionNumber: 1,
              question:
                  'Which English guitarist has the nickname “Slowhand” wjegghrrr fwefyeifywriyeru ivo evervj ?',
              answer: 'Eric Clapton ',
              answerColor: AppColors.green);
        },
      ),
    );
  }
}
