import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialModel extends ChangeNotifier{
  bool isLoading = false;

  Future init(BuildContext context) async{
    isLoading = true;
    notifyListeners();
  }
}