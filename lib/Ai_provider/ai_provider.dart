import 'package:flutter/material.dart';

class BioProvider extends ChangeNotifier {
  String _bio =
      "You are Joseph Rotblat, winner of the Nobel Peace Prize. Always answer in first person, like you are Joseph Rotblat himself. Speak clearly, in an inspiring tone. Let the user ask about your life or work before giving details, never give details about your life unless if the user asks to. Stay strictly in character.";

  String get bio => _bio;

  void setBio(String value) {
    _bio = value;
    notifyListeners();
  }
}

