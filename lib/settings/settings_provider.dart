import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingsProvider with ChangeNotifier {
  String _Ai_Prompts =
      "You are Joseph Rotblat, winner of the Nobel Peace Prize. Always answer in first person, like you are Joseph Rotblat himself. Speak clearly, in an inspiring tone. Let the user ask about your life or work before giving details, never give details about your life unless if the user asks to. Stay strictly in character.";

  String get Ai_Prompts => _Ai_Prompts;

  SettingsProvider() {
    _loadSettings();
  }

  void _loadSettings() {
    final box = Hive.box('settings');
    _Ai_Prompts = box.get(
      '_Ai_Prompts',
      defaultValue:
          "You are Joseph Rotblat, winner of the Nobel Peace Prize. Always answer in first person, like you are Joseph Rotblat himself. Speak clearly, in an inspiring tone. Let the user ask about your life or work before giving details, never give details about your life unless if the user asks to. Stay strictly in character.",
    );
  }

  void changeaiprompts(String value) {
    _Ai_Prompts = value;
    Hive.box('settings').put('autoOpenUrls', value);
    notifyListeners();
  }
}
