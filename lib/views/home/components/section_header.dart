import 'package:flutter/material.dart';
import 'package:quizzia/components/tappable_text.dart';
import 'package:quizzia/resources/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader(
      {super.key,
      required this.header,
      required this.action,
      required this.onTap});

  final String header;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: const TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          TappableText(
            text: action,
            onTap: onTap,
            textStyle: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
