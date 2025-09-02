import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzia/models/ui_models.dart';
import 'package:quizzia/navigation/navigation.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/components/app_form_fields.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/components/app_material.dart';
import 'package:quizzia/components/app_page.dart';
import 'package:quizzia/resources/app_strings.dart';
import 'package:quizzia/components/dashboard_metric_grid_view.dart';
import 'package:quizzia/view_models/home_view_model.dart';
import 'package:quizzia/views/home/components/quiz_category_card.dart';
import 'package:quizzia/views/home/components/score_history_empty_state.dart';
import 'package:quizzia/views/home/components/section_header.dart';
import 'package:quizzia/views/home/quiz_categories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  late HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = context.read<HomeViewModel>();
  }

  // Todo: Move to separate file or class
  final List<QuizCategory> quizCategories = [
    QuizCategory(
        icon: AppImages.svgMathematicsIcon, text: AppStrings.mathematics),
    QuizCategory(icon: AppImages.svgSportsIcon, text: AppStrings.sports),
    QuizCategory(icon: AppImages.svgBookIcon, text: AppStrings.history),
    QuizCategory(icon: AppImages.svgAnimalIcon, text: AppStrings.animals),
  ];

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
          Row(
            children: [
              Expanded(
                child: CustomSearchTextFormField(
                  hintText: AppStrings.searchForAnything,
                  controller: searchController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: AppMaterial(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(8),
                  inkwellBorderRadius: BorderRadius.circular(8),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: AppImages.svgFilterIcon,
                  ),
                ),
              ),
            ],
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
            children: quizCategories
                .map((quizCategory) =>
                    QuizCategoryCard(quizCategory: quizCategory))
                .toList(),
          ),
          SectionHeader(
              header: AppStrings.scoreHistory,
              action: AppStrings.viewAll,
              onTap: () {}),
          const SizedBox(height: 10),
          const ScoreHistoryEmptyState(),
          // const ScoreHistoryCard()
        ],
      ),
    );
  }
}
