import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required this.pref});

  final SharedPreferences pref;

  String get firstName => pref.getString('firstName') ?? '';
}
