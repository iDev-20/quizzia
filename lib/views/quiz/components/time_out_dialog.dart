import 'package:flutter/material.dart';
import 'package:quizzia/resources/app_buttons.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_strings.dart';

class TimeOutDialog extends StatelessWidget {
  const TimeOutDialog({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImages.svgTimeOutIcon,
            const SizedBox(height: 16),
            const Text(
              AppStrings.timeOut,
              style: TextStyle(
                  color: AppColors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              AppStrings.timeOutMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  height: 1.6),
            ),
            const SizedBox(height: 48),
            CustomAppButton(
              backgroundColor: AppColors.quizResultRed,
              onTap: () {},
              child: const Text(AppStrings.okay),
            ),
          ],
        ),
      ),
    );
  }
}
