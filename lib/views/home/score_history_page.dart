import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzia/components/app_page.dart';
import 'package:quizzia/view_models/quiz_state_view_model.dart';
import 'package:quizzia/views/home/components/score_details_empty_state_details.dart';
import 'package:quizzia/views/home/components/score_history_card.dart';

class ScoreHistoryPage extends StatefulWidget {
  const ScoreHistoryPage({super.key});

  @override
  State<ScoreHistoryPage> createState() => _ScoreHistoryPageState();
}

class _ScoreHistoryPageState extends State<ScoreHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return AppPage(
      titleText: 'Score History',
      body: Consumer<QuizStateViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.scoreHistory.isEmpty) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: ScoreHistoryEmptyStateDetails(),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: viewModel.scoreHistory.length,
            itemBuilder: (context, index) {
              final result = viewModel.scoreHistory[index];
              return ScoreHistoryCard(result: result);
            },
          );
        },
      ),
    );
  }
}
