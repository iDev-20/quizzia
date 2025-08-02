import 'package:flutter/material.dart';
import 'package:quizzia/navigation/navigation.dart';
import 'package:quizzia/resources/app_buttons.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_strings.dart';
import 'package:quizzia/views/onboarding/about_me_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 358,
                      child: Image(image: AppImages.onboardingImage),
                    ),
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        AppStrings.onboardingTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.black2,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        AppStrings.onboardingSubTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.black2, height: 1.7),
                      ),
                    ),
                  ],
                ),
              ),
              CustomAppButton(
                onTap: () {
                  Navigation.navigateToScreen(
                      context: context, screen: const AboutMeScreen());
                },
                child: const Text(AppStrings.getStarted),
              ),
              const SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: AppStrings.byClickingGetStarted,
                  style: textstyle(fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    TextSpan(
                        text: AppStrings.termsOfService, style: textstyle()),
                    const TextSpan(text: AppStrings.and),
                    TextSpan(
                        text: AppStrings.privacyPolicy, style: textstyle()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textstyle({FontWeight? fontWeight}) {
    return TextStyle(
        color: AppColors.black2,
        fontFamily: 'Raleway',
        fontSize: 12,
        fontWeight: fontWeight ?? FontWeight.w600,
        height: 2);
  }
}
