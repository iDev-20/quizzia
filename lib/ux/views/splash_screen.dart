import 'package:flutter/material.dart';
import 'package:quizzia/ux/shared/models/shared_prefs.dart';
import 'package:quizzia/ux/navigation/navigation.dart';
import 'package:quizzia/ux/shared/resources/app_colors.dart';
import 'package:quizzia/ux/shared/resources/app_images.dart';
import 'package:quizzia/ux/shared/resources/app_strings.dart';
import 'package:quizzia/ux/views/onboarding/onboarding_screen.dart';

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

  void initializeApp() async {
    await Future.delayed(const Duration(seconds: 2));

    bool isFirstTime = await SharedPrefs.isFirstTime();

    if (mounted) {
      if (isFirstTime) {
        Navigation.navigateToScreenAndClearOnePrevious(
            context: context, screen: const OnboardingScreen());
      } else {
        Navigation.navigateToHomePage(context: context);
      }
    }
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
