import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:quizzia/models/ui_models.dart';
import 'package:quizzia/navigation/navigation.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_form_fields.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_material.dart';
import 'package:quizzia/resources/app_page.dart';
import 'package:quizzia/resources/app_strings.dart';
import 'package:quizzia/resources/dashboard_metric_grid_view.dart';
import 'package:quizzia/views/home/components/quiz_category_card.dart';
import 'package:quizzia/views/home/components/section_header.dart';
import 'package:quizzia/views/home/quiz_categories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

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
      title: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AppImages.sampleProfileImage,
          ),
          const SizedBox(width: 12),
          const Text(
            '${AppStrings.hi}, ${AppStrings.sampleAppUser}',
            style: TextStyle(
                color: AppColors.black2,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ],
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
                  child: Ink(
                    padding: const EdgeInsets.all(17),
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
          DottedBorder(
            color: AppColors.dottedBorderColor,
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            dashPattern: const [8, 8],
            padding: const EdgeInsets.symmetric(horizontal: 66, vertical: 59),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppImages.svgClipboardIcon,
                const SizedBox(height: 10),
                const Text(
                  AppStrings.youHaveNoScoresRecordedYet,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.grey200, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
