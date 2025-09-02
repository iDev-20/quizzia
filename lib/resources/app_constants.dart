import 'package:quizzia/models/ui_models.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_strings.dart';

class AppConstants {
  AppConstants._();

  static List<QuizCategory> quizCategories = [
    QuizCategory(
        icon: AppImages.svgMathematicsIcon,
        text: AppStrings.mathematics,
        categoryId: 19),
    QuizCategory(
        icon: AppImages.svgSportsIcon, text: AppStrings.sports, categoryId: 21),
    QuizCategory(
        icon: AppImages.svgBookIcon, text: AppStrings.history, categoryId: 23),
    QuizCategory(
        icon: AppImages.svgAnimalIcon,
        text: AppStrings.animals,
        categoryId: 27),
    QuizCategory(
        icon: AppImages.svgAnimeIcon, text: AppStrings.anime, categoryId: 31),
    QuizCategory(
        icon: AppImages.svgCarIcon, text: AppStrings.vehicles, categoryId: 28),
    QuizCategory(
        icon: AppImages.svgFilmIcon, text: AppStrings.film, categoryId: 11),
    QuizCategory(
        icon: AppImages.svgGameControllerIcon,
        text: AppStrings.videoGames,
        categoryId: 15),
  ];

  static QuizCategory? getCategoryById(int categoryId) {
    try {
      return quizCategories
          .firstWhere((category) => category.categoryId == categoryId);
    } catch (e) {
      return null;
    }
  }

  static String getCategoryTextById(int categoryId) {
    final category = getCategoryById(categoryId);
    return category?.text ?? 'Unknown category';
  }
}
