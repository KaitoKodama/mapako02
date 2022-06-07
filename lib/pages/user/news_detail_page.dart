import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapako02/component/cp_list.dart';
import 'package:mapako02/component/footer.dart';
import 'package:mapako02/component/header.dart';
import 'package:mapako02/utility/master.dart';


class NewsDetailPage extends StatefulWidget{
  NewsDetailPage(this.newsUnit);
  final NewsUnit newsUnit;

  @override
  NewsDetailPageState createState() => NewsDetailPageState(newsUnit);
}

class NewsDetailPageState extends State<NewsDetailPage>{
  NewsDetailPageState(this.newsUnit);
  final NewsUnit newsUnit;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: ApplicationHead(context),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: buildScreenWidget(),
      ),
      bottomNavigationBar: ApplicationFoot(),
    );
  }

  Widget buildScreenWidget(){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTitle(newsUnit.title),
            Text(newsUnit.content, style: TextStyle(fontFamily: 'MPlusR', fontSize: 16)),
          ],
        ),
      ),
    );
  }
}