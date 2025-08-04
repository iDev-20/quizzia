import 'package:flutter/material.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_material.dart';

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
          AppMaterial(
            inkwellBorderRadius: BorderRadius.circular(8),
            onTap: onTap,
            child: Ink(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Text(
                action,
                style: const TextStyle(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
