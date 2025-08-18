import 'package:flutter/material.dart';
import 'package:quizzia/models/ui_models.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_page.dart';
import 'package:quizzia/resources/app_strings.dart';
import 'package:quizzia/resources/dashboard_metric_grid_view.dart';
import 'package:quizzia/views/home/components/quiz_category_card.dart';

class QuizCategoriesScreen extends StatefulWidget {
  const QuizCategoriesScreen({super.key});

  @override
  State<QuizCategoriesScreen> createState() => _QuizCategoriesScreenState();
}

class _QuizCategoriesScreenState extends State<QuizCategoriesScreen> {
  final List<QuizCategory> quizCategories = [
    QuizCategory(
        icon: AppImages.svgMathematicsIcon, text: AppStrings.mathematics),
    QuizCategory(icon: AppImages.svgSportsIcon, text: AppStrings.sports),
    QuizCategory(icon: AppImages.svgBookIcon, text: AppStrings.history),
    QuizCategory(icon: AppImages.svgAnimalIcon, text: AppStrings.animals),
    QuizCategory(icon: AppImages.svgAnimeIcon, text: AppStrings.anime),
    QuizCategory(icon: AppImages.svgCarIcon, text: AppStrings.vehicles),
    QuizCategory(icon: AppImages.svgFilmIcon, text: AppStrings.film),
    QuizCategory(
        icon: AppImages.svgGameControllerIcon, text: AppStrings.videoGames),
  ];

  @override
  Widget build(BuildContext context) {
    return AppPage(
      titleText: AppStrings.quizCategories,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          DashboardMetricGridView(
            children: quizCategories
                .map(
                  (quizCategory) =>
                      QuizCategoryCard(quizCategory: quizCategory),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
