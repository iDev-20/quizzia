import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutMeViewModel extends ChangeNotifier {
  AboutMeViewModel();

  String firstName = "";
  String otherNames = "";
  String description = "";

  static const _firstNameKey = 'firstName';
  static const _otherNamesKey = 'otherNames';
  static const _descriptionKey = 'description';

  void updateFirstName(String value) {
    firstName = value;
    notifyListeners();
  }

  void updateOtherNames(String value) {
    otherNames = value;
    notifyListeners();
  }

  void updateDescription(String value) {
    description = value;
    notifyListeners();
  }

  void saveDetailsToCache() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_firstNameKey, firstName);
    await pref.setString(_otherNamesKey, otherNames);
    await pref.setString(_descriptionKey, description);
  }

  bool get isButtonEnabled =>
      firstName.isNotEmpty && otherNames.isNotEmpty && description.isNotEmpty;
}
