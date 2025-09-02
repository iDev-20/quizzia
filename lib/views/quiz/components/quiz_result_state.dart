import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzia/components/app_buttons.dart';
import 'package:quizzia/models/ui_models.dart';
import 'package:quizzia/navigation/navigation.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/view_models/quiz_state_view_model.dart';
import 'package:quizzia/views/quiz/quiz_answers_screen.dart';

class QuizResultState extends StatelessWidget {
  const QuizResultState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Consumer<QuizStateViewModel>(builder: (context, viewModel, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            viewModel.resultIcon,
            const SizedBox(height: 56),
            Text(
              viewModel.resultText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 18),
            Text(
              'You scored ${viewModel.percentage.toStringAsFixed(0)}%',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: LinearProgressIndicator(
                value: viewModel.resultProgress,
                minHeight: 8,
                backgroundColor: AppColors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(
                    viewModel.resultProgressColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 64),
            CustomAppButton(
              backgroundColor: viewModel.resultProgressColor,
              onTap: () {
                context.read<QuizStateViewModel>().markQuizCompleted();
                context.read<QuizStateViewModel>().addResult(
                      QuizResult(
                        categoryName: viewModel.categoryName,
                        correctAnswersCount: viewModel.correctAnswersCount,
                        totalQuestionsCount: viewModel.totalQuestionsCount,
                        difficulty: viewModel.difficulty,
                        date: DateTime.now(),
                      ),
                    );
                Navigation.navigateToHomePage(context: context);
              },
              child: const Text('Go Home'),
            ),
            const SizedBox(height: 10),
            CustomAppOutlinedButton(
              borderColor: viewModel.resultProgressColor,
              foregroundColor: viewModel.resultProgressColor,
              onTap: () {
                Navigation.navigateToScreen(
                    context: context, screen: const QuizAnswersScreen());
              },
              child: const Text('See Answers'),
            ),
          ],
        );
      }),
    );
  }
}
