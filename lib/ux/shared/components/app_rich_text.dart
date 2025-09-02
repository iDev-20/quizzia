import 'package:flutter/material.dart';
import 'package:quizzia/ux/shared/resources/app_colors.dart';
import 'package:quizzia/ux/shared/resources/app_strings.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        text: AppStrings.byClickingGetStarted,
        style: TextStyle(
            color: AppColors.black2,
            fontFamily: 'Raleway',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 2),
        children: <TextSpan>[
          TextSpan(
              text: AppStrings.termsOfService,
              style: TextStyle(
                  color: AppColors.black2,
                  fontFamily: 'Raleway',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  height: 2)),
          TextSpan(text: AppStrings.and),
          TextSpan(
            text: AppStrings.privacyPolicy,
            style: TextStyle(
                color: AppColors.black2,
                fontFamily: 'Raleway',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                height: 2),
          ),
        ],
      ),
    );
  }
}
