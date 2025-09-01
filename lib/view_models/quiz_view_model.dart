import 'package:flutter/material.dart';
import 'package:quizzia/models/ui_models.dart';
import 'package:quizzia/resources/app_constants.dart';
import 'package:quizzia/resources/networking.dart';

class QuizViewModel extends ChangeNotifier {
  Future<List<Question>> getQuestions(
      {required String amount,
      required String category,
      required String difficulty}) async {
    final mappedCategory = AppConstants.categoryMap[category] ?? category;

    NetworkHelper networkHelper = NetworkHelper(
        url: 'opentdb.com',
        path: '/api.php',
        queryParams: {
          'amount': amount,
          'category': mappedCategory.toString(),
          'difficulty': difficulty
        },
        errorMessage: 'Failed to get questions');

    final response = await networkHelper.getData();

    // print(response);
    // print(networkHelper.queryParams);

    if (response == null) return [];

    final results = response['results'] as List;
    return results.map((e) => Question.fromJson(e)).toList();
  }
}
