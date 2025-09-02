import 'package:flutter/material.dart';
import 'package:quizzia/resources/app_constants.dart';
import 'package:quizzia/components/app_page.dart';
import 'package:quizzia/resources/app_strings.dart';
import 'package:quizzia/components/dashboard_metric_grid_view.dart';
import 'package:quizzia/views/home/components/quiz_category_card.dart';

class QuizCategoriesScreen extends StatefulWidget {
  const QuizCategoriesScreen({super.key});

  @override
  State<QuizCategoriesScreen> createState() => _QuizCategoriesScreenState();
}

class _QuizCategoriesScreenState extends State<QuizCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return AppPage(
      titleText: AppStrings.quizCategories,
      body: DashboardMetricGridView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        physics: const AlwaysScrollableScrollPhysics(),
        children: AppConstants.quizCategories
            .map(
              (quizCategory) => QuizCategoryCard(quizCategory: quizCategory),
            )
            .toList(),
      ),
    );
  }
}
