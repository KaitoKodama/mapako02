import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapako02/component/cp_screen.dart';
import 'package:mapako02/component/footer.dart';
import 'package:mapako02/component/header.dart';
import 'package:mapako02/models/static/tutorial_model.dart';
import 'package:provider/provider.dart';


class TutorialPage extends StatefulWidget{
  @override
  TutorialPageState createState() => TutorialPageState();
}
class TutorialPageState extends State<TutorialPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TutorialModel>(
      create: (_) =>TutorialModel()..initTutorialModel(),
      child: Scaffold(
        appBar: ApplicationHead(context),
        body: Consumer<TutorialModel>(
          builder: (context, model, child) {
            if (!model.isLoading)
              return buildScreenWidget(model);
            else
              return LoadingScreen();
          },
        ),
        bottomNavigationBar: ApplicationFoot(),
      ),
    );
  }

  Widget buildScreenWidget(TutorialModel model){
    return Container(
      child: Text("LoadDone"),
    );
  }
}