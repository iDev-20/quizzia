// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzia/navigation/navigation.dart';
import 'package:quizzia/resources/app_buttons.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_dropdown_field.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_material.dart';
import 'package:quizzia/resources/app_strings.dart';
import 'package:quizzia/view_models/quiz_settings_view_model.dart';
import 'package:quizzia/views/home/components/quiz_dialog_components.dart';

class QuizSettingsDialog extends StatefulWidget {
  const QuizSettingsDialog({super.key, required this.category});

  final String category;

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
    await viewModel.ensureInitialized(widget.category);
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
                onDecrease: () => viewModel.decreaseQuantity(widget.category),
                onIncrease: () => viewModel.increaseQuantity(widget.category),
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
              CustomAppButton(
                onTap: () {},
                child: const Text(AppStrings.startQuiz),
              ),
            ],
          );
        }),
      ),
    );
  }
}
