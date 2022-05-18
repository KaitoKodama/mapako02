import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component/cp_list.dart';
import '../../component/cp_prop.dart';
import '../../component/cp_screen.dart';
import '../../component/footer.dart';
import '../../component/funcwidget.dart';
import '../../component/header.dart';
import '../../models/user/news_model.dart';
import 'news_detail_page.dart';


class NewsPage extends StatefulWidget{
  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage>{
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider<NewsModel>(
      create: (_) => NewsModel()..initNewsModel(),
      child: Scaffold(
        appBar: ApplicationHead(context),
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Consumer<NewsModel>(
            builder: (context, model, child) {
              if(!model.isLoading) return buildScreenWidget(model);
              return LoadingScreen();
            },
          ),
        ),
        bottomNavigationBar: ApplicationFoot(),
      ),
    );
  }

  Widget buildScreenWidget(NewsModel model){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTitle('お知らせ一覧'),
            ListView.builder(
                shrinkWrap: true,
                itemCount: model.newsUnitList.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return OutlinedButton(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(model.newsUnitList[index].timeStamp, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontFamily: 'MPlusR', color: HexColor('#333333'))),
                        Text(model.newsUnitList[index].title, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontFamily: 'MPlus', color: HexColor('#333333'))),
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.only(bottom: 15),
                      side: BorderSide(color: Theme.of(context).canvasColor),
                    ),
                    onPressed: (){
                      SplashScreen(context, NewsDetailPage(model.newsUnitList[index]));
                    },
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}