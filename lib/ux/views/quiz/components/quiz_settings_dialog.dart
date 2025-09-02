// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzia/ux/navigation/navigation.dart';
import 'package:quizzia/ux/shared/components/app_buttons.dart';
import 'package:quizzia/ux/shared/resources/app_colors.dart';
import 'package:quizzia/ux/shared/components/app_dropdown_field.dart';
import 'package:quizzia/ux/shared/resources/app_images.dart';
import 'package:quizzia/ux/shared/components/app_material.dart';
import 'package:quizzia/ux/shared/resources/app_strings.dart';
import 'package:quizzia/ux/shared/view_models/quiz_settings_view_model.dart';
import 'package:quizzia/ux/shared/view_models/quiz_state_view_model.dart';
import 'package:quizzia/ux/shared/view_models/quiz_view_model.dart';
import 'package:quizzia/ux/views/quiz/components/quiz_dialog_components.dart';
import 'package:quizzia/ux/views/quiz/quiz_screen.dart';

class QuizSettingsDialog extends StatefulWidget {
  const QuizSettingsDialog(
      {super.key, required this.categoryId, this.categoryname});

  final int categoryId;
  final String? categoryname;

  @override
  State<QuizSettingsDialog> createState() => _QuizSettingsDialogState();
}

class _QuizSettingsDialogState extends State<QuizSettingsDialog> {
  late final QuizSettingsViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = context.read<QuizSettingsViewModel>();
    initializeSettings();
  }

  Future<void> initializeSettings() async {
    await viewModel.ensureInitialized(widget.categoryId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child:
            Consumer<QuizSettingsViewModel>(builder: (context, viewModel, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    AppStrings.quizSettings,
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  AppMaterial(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        Navigation.back(context: context);
                      },
                      child: AppImages.svgCloseIcon)
                ],
              ),
              const SizedBox(height: 26),
              QuizSizeSelector(
                canDecrease: viewModel.canDecrease,
                canIncrease: viewModel.canIncrease,
                quizQuantity: viewModel.quizQuantity,
                onDecrease: () =>
                    viewModel.decreaseQuantity(widget.categoryId.toString()),
                onIncrease: () =>
                    viewModel.increaseQuantity(widget.categoryId.toString()),
              ),
              const SizedBox(height: 30),
              CustomAppDropDownField(
                labelText: AppStrings.selectDifficulty,
                stringItems: true,
                items: viewModel.difficulties,
                valueHolder: viewModel.selectedDifficulty,
                onChanged: (selectedDifficulty) {
                  if (selectedDifficulty != null) {
                    viewModel.setDifficulty(selectedDifficulty);
                  }
                },
              ),
              const SizedBox(height: 58),
              Consumer<QuizViewModel>(builder: (context, quizViewModel, _) {
                return CustomAppButton(
                  onTap: () async {
                    context.read<QuizStateViewModel>().setQuizSettings(
                        amount: viewModel.quizQuantity.toString(),
                        category: widget.categoryId.toString(),
                        difficulty: viewModel.apiDifficulty,
                        categoryName: widget.categoryname);
                    Navigation.back(context: context);
                    Navigation.navigateToScreen(
                      context: context,
                      screen: const QuizScreen(),
                    );
                  },
                  child: const Text(AppStrings.startQuiz),
                );
              }),
            ],
          );
        }),
      ),
    );
  }
}
