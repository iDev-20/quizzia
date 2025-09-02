import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzia/models/shared_prefs.dart';
import 'package:quizzia/navigation/navigation.dart';
import 'package:quizzia/resources/app_buttons.dart';
import 'package:quizzia/resources/app_form_fields.dart';
import 'package:quizzia/resources/app_page.dart';
import 'package:quizzia/resources/app_strings.dart';
import 'package:quizzia/view_models/about_me_view_model.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  late AboutMeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = context.read<AboutMeViewModel>();
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
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    viewModel.updateFirstName(value);
                  },
                ),
                CustomAppTextFormField(
                  labelText: AppStrings.enterYourOtherNames,
                  hintText: AppStrings.otherNames,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    viewModel.updateOtherNames(value);
                  },
                ),
                CustomAppLongTextFormField(
                  labelText: AppStrings.describeYourself,
                  hintText: AppStrings.brieflyDescribeYourself,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    viewModel.updateDescription(value);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
            child: Consumer<AboutMeViewModel>(
              builder: (context, vm, _) {
                return CustomAppButton(
                  enabled: vm.isButtonEnabled,
                  onTap: () async {
                    vm.saveDetailsToCache();
                    await SharedPrefs.setOnboardingComplete();
                    // ignore: use_build_context_synchronously
                    Navigation.navigateToHomePage(context: context);
                  },
                  child: const Text(AppStrings.submit),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
