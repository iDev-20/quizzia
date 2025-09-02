import 'package:flutter/material.dart';
import 'package:quizzia/navigation/navigation.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_images.dart';

class AppPage extends StatelessWidget {
  const AppPage(
      {super.key,
      this.backgroundColor = AppColors.white,
      this.titleText,
      this.title,
      required this.body});

  final Color backgroundColor;
  final String? titleText;
  final Widget? title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          leading: (title != null)
              ? null
              : InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Navigation.back(context: context);
                  },
                  child: Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: AppImages.svgBackIcon),
                ),
          centerTitle: false,
          title: title ?? Text(titleText ?? ''),
          titleTextStyle: const TextStyle(
              color: AppColors.black2,
              fontFamily: 'Raleway',
              fontSize: 16,
              fontWeight: FontWeight.bold),
          titleSpacing: 0,
        ),
        body: SafeArea(child: body),
      ),
    );
  }
}
