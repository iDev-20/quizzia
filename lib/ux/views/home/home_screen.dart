import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzia/ux/navigation/navigation.dart';
import 'package:quizzia/ux/shared/resources/app_colors.dart';
import 'package:quizzia/ux/shared/resources/app_constants.dart';
import 'package:quizzia/ux/shared/resources/app_images.dart';
import 'package:quizzia/ux/shared/components/app_page.dart';
import 'package:quizzia/ux/shared/resources/app_strings.dart';
import 'package:quizzia/ux/shared/components/dashboard_metric_grid_view.dart';
import 'package:quizzia/ux/shared/view_models/home_view_model.dart';
import 'package:quizzia/ux/shared/view_models/quiz_state_view_model.dart';
import 'package:quizzia/ux/views/home/score_history_page.dart';
import 'package:quizzia/ux/views/quiz/components/quiz_category_card.dart';
import 'package:quizzia/ux/views/home/components/score_history_card.dart';
import 'package:quizzia/ux/views/home/components/score_history_empty_state.dart';
import 'package:quizzia/ux/views/home/components/search_widget.dart';
import 'package:quizzia/ux/views/home/components/section_header.dart';
import 'package:quizzia/ux/views/quiz/quiz_categories_screen.dart';
import 'package:quizzia/ux/views/home/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = context.read<HomeViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AppImages.sampleProfileImage,
            ),
            const SizedBox(width: 12),
            Text(
              '${AppStrings.hi}, ${viewModel.firstName}',
              style: const TextStyle(
                  color: AppColors.black2,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          SearchWidget(
            enabled: false,
            onTap: () {
              Navigation.navigateToScreen(
                  context: context, screen: const SearchScreen());
            },
          ),
          SectionHeader(
              header: AppStrings.categories,
              action: AppStrings.seeMore,
              onTap: () {
                Navigation.navigateToScreen(
                    context: context, screen: const QuizCategoriesScreen());
              }),
          const SizedBox(height: 20),
          DashboardMetricGridView(
            children: AppConstants.quizCategories
                .take(4)
                .map((quizCategory) =>
                    QuizCategoryCard(quizCategory: quizCategory))
                .toList(),
          ),
          SectionHeader(
              header: AppStrings.scoreHistory,
              action: AppStrings.viewAll,
              onTap: () {
                Navigation.navigateToScreen(
                    context: context, screen: const ScoreHistoryPage());
              }),
          const SizedBox(height: 10),
          Consumer<QuizStateViewModel>(
            builder: (context, viewModel, _) {
              return viewModel.completedQuiz
                  ? Column(
                      children: viewModel.scoreHistory
                          .take(3)
                          .map((quiz) => ScoreHistoryCard(result: quiz))
                          .toList(),
                    )
                  : const ScoreHistoryEmptyState();
            },
          ),
        ],
      ),
    );
  }
}
