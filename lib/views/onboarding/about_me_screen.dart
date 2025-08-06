import 'package:flutter/material.dart';
import 'package:quizzia/navigation/navigation.dart';
import 'package:quizzia/resources/app_buttons.dart';
import 'package:quizzia/resources/app_form_fields.dart';
import 'package:quizzia/resources/app_page.dart';
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

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    firstNameController.addListener((onTextFieldChanged));
    otherNamesController.addListener((onTextFieldChanged));
    descriptionTextController.addListener((onTextFieldChanged));
  }

  void onTextFieldChanged() {
    if (enableButton() != isButtonEnabled) {
      setState(() {
        isButtonEnabled = enableButton();
      });
    }
  }

  bool enableButton() {
    return firstNameController.text.isNotEmpty &&
        otherNamesController.text.isNotEmpty &&
        descriptionTextController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      titleText: AppStrings.aboutMe,
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
                ),
                CustomAppTextFormField(
                  labelText: AppStrings.enterYourOtherNames,
                  hintText: AppStrings.otherNames,
                  controller: otherNamesController,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                CustomAppLongTextFormField(
                  labelText: AppStrings.describeYourself,
                  hintText: AppStrings.brieflyDescribeYourself,
                  controller: descriptionTextController,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
            child: CustomAppButton(
              enabled: isButtonEnabled,
              onTap: () {
                Navigation.navigateToHomePage(context: context);
              },
              child: const Text(AppStrings.submit),
            ),
          ),
        ],
      ),
    );
  }
}
