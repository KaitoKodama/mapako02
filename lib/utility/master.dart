import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'enum.dart';


/* ---------------------------------------
 マスター情報
---------------------------------------- */
class MasterPartialInfo{
  MasterPartialInfo(Map<String, dynamic> mapRef, String? ownerID){
    //オーナーではない場合はnullを格納
    this.ownerID = ownerID;

    //データの格納(オーナーであれば修正も実行される)
    final safe = new SafeStorage(mapRef, ownerID, 'user_info');
    safe.store<String>('user_icon', '', (field){ this.iconPath = field; });
    safe.store<String>('user_id',  '', (field){ this.userID = field; });
    safe.store<String>('user_name',  '', (field){ this.userName = field; });
    safe.store<String>('user_comment',  '', (field){ this.userComment = field; });
    safe.store<String>('user_exp',  '', (field){ this.userExplain = field; });
    safe.store<int>('latest_news',  0, (field){ this.latestNewsID = field; });
    safe.store<bool>('is_seen', false, (field){ this.isTutorialSeen = field; });
    safe.store<bool>('is_logout', false, (field){ this.isLogout = field; });
  }
  String? ownerID;
  String userID = '';
  String iconPath = '';
  String userName = '';
  String userComment = '';
  String userExplain = '';
  int latestNewsID = 0;
  bool isLogout = false;
  bool isTutorialSeen = false;
  bool isProviding = false;

  ImageProvider getIconFromPath(){
    if(iconPath != '') return Image.network(iconPath, filterQuality: FilterQuality.low).image;
    else return Image.asset('images/base-icon.png').image;
  }
}


/* ---------------------------------------
 マスター情報モジュール
---------------------------------------- */
class MasterCompletedInfo extends MasterPartialInfo{
  MasterCompletedInfo(Map<String, dynamic> mapRef, Map<String, dynamic> childMap, String? ownerID) : super(mapRef, ownerID){
    childMap.forEach((childID, map){
      childInfoList.add(ChildDetail(map, childID, ownerID));
    });
  }

  List<ChildDetail> childInfoList = [];
  String getLatestID(){
    List<int> childIDList = [];
    childInfoList.forEach((element) {
      childIDList.add(int.parse(element.childID));
    });
    String latestID = (childIDList.reduce(max)+1).toString();
    return latestID;
  }

  void addChildDetailToList(String targetID){
    childInfoList.add(ChildDetail({}, targetID, ownerID));
  }
  void removeChildDetailFromListDueToID(String removeID){
    var removeElement;
    childInfoList.forEach((element) {
      if(element.childID == removeID){
        removeElement = element;
      }
    });
    if(removeElement != null){
      childInfoList.remove(removeElement);
    }
  }
}

/* ---------------------------------------
 お子様情報
---------------------------------------- */
class ChildDetail{
  ChildDetail(Map<String, dynamic> mapRef, String childID, String ?ownerID){
    this.childID = childID;
    if(mapRef.isNotEmpty){
      final safe = new SafeStorage(mapRef, ownerID, 'child_info.$childID');
      safe.store<String>('child_order', '', (field){
        this.orderUnitList.initSelectUnit(field);
      });
      safe.store<String>('child_icon', '', (field){ this.iconPath = field; });
      safe.store<String>('child_name', '', (field){ this.name = field; });
      safe.store<String>('child_birth', '', (field){ this.birth = field; });
      safe.store<String>('child_fav', '', (field){ this.favoriteFood = field; });
      safe.store<String>('child_hate', '', (field){ this.hateFood = field; });
      safe.store<String>('child_aller', '', (field){ this.allergy = field; });
      safe.store<String>('child_person', '', (field){ this.personality = field; });
      safe.store<String>('child_exe', '', (field){ this.etc = field; });
    }
  }
  ChildOrderUnitList orderUnitList = new ChildOrderUnitList();
  String childID = '';
  String iconPath = '';
  String name = '-';
  String birth = '-';
  String favoriteFood = '-';
  String hateFood = '-';
  String allergy = '-';
  String personality = '-';
  String etc = '-';
  bool isProviding = false;

  ImageProvider getIconFromPath(){
    ImageProvider _icon;
    if(iconPath != ''){
      _icon = Image.network(iconPath, filterQuality: FilterQuality.low).image;
    }
    else{
      _icon = Image.asset('images/base-icon.png').image;
    }
    return _icon;
  }
}


/* ---------------------------------------
 安全にドキュメントを格納する(ない場合は作成する)
---------------------------------------- */
class SafeStorage{
  // データのオーナーが自身の時のみフィールドの修正を実行する
  SafeStorage(this.field, this.ownerID, this.fieldBegin);
  final docRef = FirebaseFirestore.instance.collection('users');
  final Map<String, dynamic> field;
  final String? ownerID;
  final String fieldBegin;

  void store<T>(String fieldName, T defValue, Function method) async{
    if(field[fieldName] != null){
      method(field[fieldName]);
    }
    else{
      if(ownerID != null){
        await docRef.doc(ownerID).update({
          '$fieldBegin.$fieldName': defValue,
        });
      }
    }
  }
}


/* ---------------------------------------
 続き柄ユニット情報
---------------------------------------- */
class ChildOrderUnitList{
  List<ChildOrderUnit> unitList=[
    ChildOrderUnit('長男', ChildOrder.male01),
    ChildOrderUnit('次男', ChildOrder.male02),
    ChildOrderUnit('三男', ChildOrder.male03),
    ChildOrderUnit('四男', ChildOrder.male04),
    ChildOrderUnit('五男', ChildOrder.male05),
    ChildOrderUnit('長女', ChildOrder.female01),
    ChildOrderUnit('次女', ChildOrder.female02),
    ChildOrderUnit('三女', ChildOrder.female03),
    ChildOrderUnit('四女', ChildOrder.female04),
    ChildOrderUnit('五女', ChildOrder.female05),
  ];
  ChildOrderUnit selectUnit = ChildOrderUnit('長男', ChildOrder.male01);

  void initSelectUnit(String name){
    for(var unit in unitList){
      if(unit.name == name){
        selectUnit = unit;
        return;
      }
    }
  }
  void setUnitFromEnum(ChildOrder order){
    for(var unit in unitList){
      if(unit.order == order){
        selectUnit = unit;
        return;
      }
    }
  }
}
class ChildOrderUnit{
  ChildOrderUnit(this.name, this.order);
  String name;
  ChildOrder order;
}


/* ---------------------------------------
 ニュースユニット情報
---------------------------------------- */
class NewsUnit{
  NewsUnit(dynamic newsSnap){
    if(newsSnap['time'] != null) timeStamp = newsSnap['time'];
    if(newsSnap['title'] != null) title = newsSnap['title'];
    if(newsSnap['content'] != null) content = newsSnap['content'];
  }
  String timeStamp = '';
  String title = '';
  String content = '';
}