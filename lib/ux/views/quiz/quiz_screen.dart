import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzia/ux/shared/components/app_page.dart';
import 'package:quizzia/ux/navigation/navigation.dart';
import 'package:quizzia/ux/shared/view_models/quiz_state_view_model.dart';
import 'package:quizzia/ux/views/quiz/components/quiz_contents.dart';
import 'package:quizzia/ux/views/quiz/components/small_quiz_components.dart';
import 'package:quizzia/ux/views/quiz/quiz_result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<QuizStateViewModel>().loadQuestions();
    });
  }

  void nextQuestion() {
    final viewModel = context.read<QuizStateViewModel>();
    if (viewModel.currentQuestionIndex < viewModel.questions.length - 1) {
      viewModel.nextQuestion();
    } else {
      Navigation.navigateToScreen(
          context: context, screen: const QuizResultScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizStateViewModel>(builder: (context, quizStateVM, _) {
      return AppPage(
        titleText: '${quizStateVM.categoryName} Quiz',
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: buildContent(quizStateVM),
        ),
      );
    });
  }

  Widget buildContent(QuizStateViewModel viewModel) {
    if (viewModel.isLoading) {
      return const LoadingWidget();
    }

    if (!viewModel.hasQuestions) {
      return const EmptyStateWidget();
    }

    final currentQuestion = viewModel.questions[viewModel.currentQuestionIndex];
    final selectedAnswer =
        viewModel.userAnswers[viewModel.currentQuestionIndex];

    return QuizContent(
      question: currentQuestion,
      progress: viewModel.progress,
      currentIndex: viewModel.currentQuestionIndex,
      totalQuestions: viewModel.questions.length,
      selectedAnswer: selectedAnswer.isNotEmpty ? selectedAnswer : null,
      onAnswerSelected: (answer) => viewModel.setAnswer(answer),
      onNext: nextQuestion,
      hasSelectedAnswer: selectedAnswer.isNotEmpty,
    );
  }
}
