import 'package:flutter/material.dart';

class CorrectAnswerProvider with ChangeNotifier {
  List<String> correctAnswer = [];

  // ฟังก์ชันในการอัพเดท correctAnswer
  void updateCorrectAnswer(List<String> newAnswer) {
    correctAnswer = newAnswer;
    notifyListeners();  // แจ้งให้ผู้ฟัง (listeners) ทราบว่ามีการเปลี่ยนแปลง
  }
}
