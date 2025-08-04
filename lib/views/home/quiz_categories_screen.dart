import 'package:flutter/material.dart';
import 'package:quizzia/resources/app_page.dart';

class QuizCategoriesScreen extends StatefulWidget {
  const QuizCategoriesScreen({super.key});

  @override
  State<QuizCategoriesScreen> createState() => _QuizCategoriesScreenState();
}

class _QuizCategoriesScreenState extends State<QuizCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return AppPage(
      body: ListView(),
    );
  }
}
