import 'package:flutter/material.dart';
import 'package:quizzia/navigation/navigation.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_strings.dart';
import 'package:quizzia/views/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  void initializeApp() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigation.navigateToScreenAndClearOnePrevious(
          context: context, screen: const OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 148,
                    width: 116,
                    child: Image(image: AppImages.appLogo),
                  ),
                ),
                const Text(
                  AppStrings.developedByMe,
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
