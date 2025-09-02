import 'package:flutter/material.dart';
import 'package:quizzia/components/app_page.dart';
import 'package:quizzia/resources/app_strings.dart';
import 'package:quizzia/views/quiz/components/quiz_result_state.dart';

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
