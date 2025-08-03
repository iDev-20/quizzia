import 'package:flutter/material.dart';
import 'package:quizzia/navigation/navigation.dart';
import 'package:quizzia/resources/app_buttons.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_form_fields.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_strings.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController otherNamesController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: InkWell(
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
          title: const Text('About Me'),
          titleTextStyle: const TextStyle(
              color: AppColors.black2,
              fontSize: 16,
              fontWeight: FontWeight.bold),
          titleSpacing: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  CustomAppTextFormField(
                    labelText: AppStrings.enterYourFirstName,
                    hintText: AppStrings.firstName,
                    controller: firstNameController,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onChanged: (c) {
                      setState(() {});
                    },
                  ),
                  CustomAppTextFormField(
                    labelText: AppStrings.enterYourOtherNames,
                    hintText: AppStrings.otherNames,
                    controller: otherNamesController,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onChanged: (c) {
                      setState(() {});
                    },
                  ),
                  CustomAppLongTextFormField(
                    labelText: AppStrings.describeYourself,
                    hintText: AppStrings.brieflyDescribeYourself,
                    controller: descriptionTextController,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    onChanged: (c) {
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
              child: CustomAppButton(
                enabled: enableButton(),
                onTap: () {},
                child: const Text(AppStrings.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool enableButton() {
    return firstNameController.text.isNotEmpty &&
        otherNamesController.text.isNotEmpty &&
        descriptionTextController.text.isNotEmpty;
  }
}
