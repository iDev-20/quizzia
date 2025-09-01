import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/view_models/about_me_view_model.dart';
import 'package:quizzia/view_models/quiz_difficulty_view_model.dart';
import 'package:quizzia/views/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => QuizDifficultyViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AboutMeViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizzia',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          primarySwatch: Colors.amber,
          useMaterial3: false,
          fontFamily: 'Raleway'),
      home: const SplashScreen(),
    );
  }
}
