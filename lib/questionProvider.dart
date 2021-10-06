import 'package:flutter/material.dart';

class QuestionState extends ChangeNotifier {
  int index = 0;
  String reponse = "Reponse";
  QuestionState({required this.index});
  void next(int length) {
    if (index < length - 1) {
      print(index);
      print(length);
      index++;
      setReponse("reponse");
      notifyListeners();
    } else
      setReponse("fin des questions");
  }

  void setReponse(String reponse) {
    this.reponse = reponse;
    notifyListeners();
  }
}
