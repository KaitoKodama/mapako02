import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapako02/component/cp_button.dart';
import 'package:mapako02/component/cp_prop.dart';
import 'package:mapako02/component/funcwidget.dart';
import 'package:mapako02/component/header.dart';
import 'package:mapako02/models/static/tutorial_model.dart';
import 'package:mapako02/pages/setting/signup_page.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:provider/provider.dart';


class TutorialPage extends StatefulWidget{
  @override
  TutorialPageState createState() => TutorialPageState();
}
class TutorialPageState extends State<TutorialPage> with TickerProviderStateMixin{
  final PageController controller = PageController(viewportFraction: 0.8);
  final _currentPageNotifier = ValueNotifier<int>(0);
  late List<Widget> pageList = [
    tutorialPage01(),
    tutorialPage02(),
    tutorialPage03(),
    tutorialPage04(),
    tutorialPage05(),
    tutorialPage06(),
  ];
  late AnimationController avatarController;
  late Animation<double> avatarSize;


  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      int next = controller.page!.round();
      if (_currentPageNotifier.value != next) {
        setState(() {
          _currentPageNotifier.value = next;
        });
      }
    });
    avatarController= AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    avatarSize = new Tween(begin: 1.0, end: 0.1).animate(
      new CurvedAnimation(parent: avatarController, curve: Curves.linear),
    );
    avatarController.repeat(reverse: true);
  }
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider<TutorialModel>(
      create: (_) => TutorialModel()..init(context),
      child: Scaffold(
        appBar: ApplicationSimpleHead(context),
        body: Consumer<TutorialModel>(
            builder: (context, model, child) {
              return buildScreenWidget(model);
            }
        ),
      ),
    );
  }

  Widget buildScreenWidget(TutorialModel model){
    return Container(
      color: HexColor('#F3F7FD'),
      child: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: pageList.length,
              itemBuilder: (context, int index) {
                bool active = index == _currentPageNotifier.value;
                return _createCardAnimate(pageList[index], active);
              },
            ),
          ),
          Container(
            height: 30.0,
            child: CirclePageIndicator(
              selectedDotColor: HexColor('#1595B9'),
              dotColor: HexColor('#BCBCBC'),
              onPageSelected: (index){
                cardAnimationBegin(index);
              },
              itemCount: pageList.length,
              currentPageNotifier: _currentPageNotifier,
            ),
          ),
        ],
      ),
    );
  }

  void cardAnimationBegin(int index){
    controller.animateToPage(index, duration: Duration(milliseconds: 1000), curve: Curves.easeOutQuint);
  }
  AnimatedContainer _createCardAnimate(Widget widget, bool active) {
    final double side = active ? 0 : 40;
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: 0, bottom: 0, right: side, left: side),
      child: widget,
    );
  }

  Widget tutorialPage01(){
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: SizedBox(
                  width: 255,
                  child: Image.asset("images/tutorials/01.png")
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: StyledButton('使い方の説明に進む', HexColor('#FFFFFF'), HexColor('#1595B9'), HexColor('#1595B9'), ()=>{
                cardAnimationBegin(1)
              }),
            ),
            StyledButton('使い方の説明をスキップする', HexColor('#FFFFFF'), HexColor('#47BBD6'), HexColor('#47BBD6'), ()=>{
              cardAnimationBegin(pageList.length-1)
            }),
          ],
        )
    );
  }
  Widget tutorialPage02(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Image.asset("images/tutorials/02.png"),
          ),
          StyledButton('使い方の説明をスキップする', HexColor('#FFFFFF'), HexColor('#47BBD6'), HexColor('#47BBD6'), ()=>{
            cardAnimationBegin(pageList.length-1)
          }),
        ],
      ),
    );
  }
  Widget tutorialPage03(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Image.asset("images/tutorials/03.png"),
          ),
          StyledButton('使い方の説明をスキップする', HexColor('#FFFFFF'), HexColor('#47BBD6'), HexColor('#47BBD6'), ()=>{
            cardAnimationBegin(pageList.length-1)
          }),
        ],
      ),
    );
  }
  Widget tutorialPage04(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Image.asset("images/tutorials/04.png"),
          ),
          StyledButton('使い方の説明をスキップする', HexColor('#FFFFFF'), HexColor('#47BBD6'), HexColor('#47BBD6'), ()=>{
            cardAnimationBegin(pageList.length-1)
          }),
        ],
      ),
    );
  }
  Widget tutorialPage05(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Stack(
              children: [
                Image.asset("images/tutorials/05.png"),
                Positioned(
                  right: 101, bottom: -8,
                  width: 50, height: 50,
                  child: AnimatedBuilder(
                    animation: avatarController,
                    builder: (context, widget) => Align(
                      child: Opacity(
                        opacity: avatarSize.value,
                        child: Image.asset('images/tutorials/circle02.png')
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
          StyledButton('使い方の説明をスキップする', HexColor('#FFFFFF'), HexColor('#47BBD6'), HexColor('#47BBD6'), ()=>{
            cardAnimationBegin(pageList.length-1)
          }),
        ],
      ),
    );
  }
  Widget tutorialPage06(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Stack(
              clipBehavior: Clip.antiAlias,
              children: [
                Image.asset("images/tutorials/06.png"),
                Positioned(
                    right: 37, bottom: -8,
                    width: 50, height: 50,
                    child: AnimatedBuilder(
                      animation: avatarController,
                      builder: (context, widget) => Align(
                        child: Opacity(
                            opacity: avatarSize.value,
                            child: Image.asset('images/tutorials/circle02.png')
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
          StyledButton('MAPAKOをはじめる', HexColor('#FFFFFF'), HexColor('#47BBD6'), HexColor('#47BBD6'), ()=>{
            SplashScreen(context, SignupPage()),
          }),
        ],
      ),
    );
  }
}