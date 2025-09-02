import 'package:flutter/material.dart';
import 'package:quizzia/components/app_page.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_strings.dart';
import 'package:quizzia/views/quiz/components/quiz_result_state.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      titleText: AppStrings.quizResult,
      body: QuizResultState(),
      // body: ListView(
      //   children: [
      //     quizResultCard(
      //         questionNumber: 1,
      //         question:
      //             'Which English guitarist has the nickname “Slowhand” wjegghrrr fwefyeifywriyeru ivo evervj ?',
      //         answer: 'Eric Clapton ',
      //         answerColor: AppColors.green),
      //   ],
      // ),
    );
  }

  Widget quizResultCard(
      {required int questionNumber,
      required String question,
      required String answer,
      required Color answerColor}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.grey),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$questionNumber. ',
                style: const TextStyle(color: AppColors.black, height: 1.57),
              ),
              Expanded(
                child: Text(
                  question,
                  style: const TextStyle(color: AppColors.black, height: 1.57),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Answer: $answer',
            style: TextStyle(color: answerColor, height: 1.57),
          ),
        ],
      ),
    );
  }
}
