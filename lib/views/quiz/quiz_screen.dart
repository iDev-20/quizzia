import 'package:flutter/material.dart';
import 'package:quizzia/models/ui_models.dart';
import 'package:quizzia/navigation/navigation.dart';
import 'package:quizzia/resources/app_page.dart';
import 'package:quizzia/view_models/quiz_view_model.dart';
import 'package:quizzia/views/quiz/components/quiz_contents.dart';
import 'package:quizzia/views/quiz/components/small_quiz_components.dart';
import 'package:quizzia/views/quiz/quiz_result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(
      {super.key,
      required this.amount,
      required this.category,
      required this.difficulty});

  final String amount;
  final String category;
  final String difficulty;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Future<List<Question>> questionsFuture;
  int currentQuestionIndex = 0;
  String? selectedAnswer;

  @override
  void initState() {
    super.initState();
    currentQuestionIndex = 0;
    selectedAnswer = null;
    questionsFuture = QuizViewModel().getQuestions(
      amount: widget.amount,
      category: widget.category,
      difficulty: widget.difficulty.toLowerCase(),
    );
  }

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
    });
  }

  void nextQuestion(List<Question> questions) {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
      });
    } else {
      Navigation.navigateToScreen(
        context: context,
        screen: const QuizResultScreen(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      titleText: '${widget.category} Quiz',
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: FutureBuilder<List<Question>>(
          future: questionsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingWidget();
            }

            if (snapshot.hasError) {
              return AppErrorWidget(error: snapshot.error.toString());
            }

            final questions = snapshot.data ?? [];

            if (questions.isEmpty || currentQuestionIndex >= questions.length) {
              return const EmptyStateWidget();
            }
            final currentQuestion = questions[currentQuestionIndex];
            double progress = (currentQuestionIndex + 1) / questions.length;

            return QuizContent(
              question: currentQuestion,
              progress: progress,
              currentIndex: currentQuestionIndex,
              totalQuestions: questions.length,
              selectedAnswer: selectedAnswer,
              onAnswerSelected: selectAnswer,
              onNext: () {
                nextQuestion(questions);
              },
              hasSelectedAnswer: selectedAnswer != null,
            );
          },
        ),
      ),
    );
  }
}
