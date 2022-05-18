import 'package:flutter/cupertino.dart';


class TutorialModel extends ChangeNotifier{
  bool isLoading = true;


  Future initTutorialModel() async{


    isLoading = false;
    notifyListeners();
  }
}