import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapako02/component/cp_list.dart';
import 'package:mapako02/models/static/contact_model.dart';
import 'package:provider/provider.dart';
import 'package:mapako02/component/cp_prop.dart';
import 'package:mapako02/component/footer.dart';
import 'package:mapako02/component/header.dart';

class ContactPage extends StatefulWidget{
  @override
  _ContactPageState createState() => _ContactPageState();
}

//お問い合わせページ
class _ContactPageState extends State<ContactPage>{
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider<ContactModel>(
        create: (_) => ContactModel(),
        child: Scaffold(
        appBar: ApplicationHead(context),
          body: Consumer<ContactModel>(
            builder: (context, model, child) {
              return buildScreenWidget(model);
            }
          ),
          bottomNavigationBar: ApplicationFoot(),
        ),
    );
  }

  Widget buildScreenWidget(ContactModel model){
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTitle('お問い合わせはこちら'),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text('外部リンクへ移動します', style: TextStyle(color: HexColor('#000000'), fontFamily: 'MPlusR', fontSize: 12)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: OutlinedButton(
                    child: Text('お問い合わせページに移動', style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'MPlus', fontSize: 12)),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: HexColor('#1595B9'),
                      side: BorderSide(color: HexColor('#1595B9')),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                    ),
                    onPressed: () {
                      model.lunchTargetUrl();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}