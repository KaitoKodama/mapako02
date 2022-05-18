import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../component/cp_button.dart';
import '../../component/cp_input.dart';
import '../../component/cp_prop.dart';
import '../../component/funcwidget.dart';
import '../../component/header.dart';
import '../../main.dart';
import '../../models/setting/reset_model.dart';


class ResetPage extends StatefulWidget {
  @override
  ResetPageState createState() => ResetPageState();
}
class ResetPageState extends State<ResetPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ResetModel>(
      create: (_) => ResetModel(),
      child: Scaffold(
        backgroundColor: HexColor('#F3F7FD'),
        appBar: ApplicationSimpleHead(context),
        body: Consumer<ResetModel>(
          builder: (context, model, child) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 25),
                        child: Text(
                          '新規登録に使用した\nメールアドレスを入力してください',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: HexColor('#333333'),fontFamily: 'MPlusR',fontSize: 14),
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: StyledInputField(HexColor('#1595B9'),HexColor('#1595B9'),'メールアドレス','',(text) => {
                        model.mail = text
                      }),
                    ),
                    StyledButton('再設定リクエストを送信',HexColor('#FFFFFF'),HexColor('#1595B9'),HexColor('#1595B9'),()async{
                      try {
                        await model.requireResetPassword();
                        DisplayDialog('送信を完了しました',model.mail+'宛にパスワード再設定メールを送信しました。','戻る',context,()=>{
                          Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomePage()))
                        });
                      }
                      catch (e) {
                        DisplayDialog('メールアドレスまたはパスワードに誤りがあります','再度確認し入力をお願いします','戻る',context,()=>{
                          Navigator.pop(context)
                        });
                      }
                    }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
