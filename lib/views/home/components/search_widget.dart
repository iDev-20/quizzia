import 'package:flutter/material.dart';
import 'package:quizzia/components/app_form_fields.dart';
import 'package:quizzia/components/app_material.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_strings.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    this.enabled,
    this.onTap,
  });

  final bool? enabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomSearchTextFormField(
            hintText: AppStrings.searchForAnything,
            enabled: enabled ?? true,
            onTap: onTap
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: AppMaterial(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(8),
            inkwellBorderRadius: BorderRadius.circular(8),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: AppImages.svgFilterIcon,
            ),
          ),
        ),
      ],
    );
  }
}
