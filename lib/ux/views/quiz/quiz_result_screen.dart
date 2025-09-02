import 'package:flutter/material.dart';
import 'package:quizzia/ux/shared/components/app_page.dart';
import 'package:quizzia/ux/shared/resources/app_strings.dart';
import 'package:quizzia/ux/views/quiz/components/quiz_result_state.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      titleText: AppStrings.quizResult,
      body: QuizResultState(),
    );
  }
}
