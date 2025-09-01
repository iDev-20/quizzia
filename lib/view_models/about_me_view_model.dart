import 'package:flutter/material.dart';

class AboutMeViewModel extends ChangeNotifier{
  AboutMeViewModel();

  String firstName = "";
  String otherNames = "";
  String description = "";

  void updateFirstName(String value){
    firstName = value;
    notifyListeners();
  }

  void updateOtherNames(String value){
    otherNames = value;
    notifyListeners();
  }

  void updateDescription(String value){
    description = value;
    notifyListeners();
  }

  void saveDetailsToCache() async {
   // final pref = await SharedPreferences.getInstance();
   // handle caching stuff
  }

  bool get isButtonEnabled =>
     firstName.isNotEmpty && otherNames.isNotEmpty && description.isNotEmpty;

}