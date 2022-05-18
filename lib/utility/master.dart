import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'enum.dart';


/* ---------------------------------------
 マスター情報
---------------------------------------- */
class MasterPartialInfo{
  MasterPartialInfo(Map<String, dynamic> mapRef){
    if(mapRef['user_icon'] != null) this.iconPath = mapRef['user_icon'];
    if(mapRef['user_id'] != null) this.userID = mapRef['user_id'];
    if(mapRef['user_name'] != null) this.userName = mapRef['user_name'];
    if(mapRef['user_comment'] != null) this.userComment = mapRef['user_comment'];
    if(mapRef['user_exp'] != null) this.userExplain = mapRef['user_exp'];
    if(mapRef['latest_news'] != null) this.latestNewsID = mapRef['latest_news'];
    if(mapRef['is_logout'] != null) this.isLogout = mapRef['is_logout'];
  }
  final uid = FirebaseAuth.instance.currentUser!.uid;
  String userID = '';
  String iconPath = '';
  String userName = '-';
  String userComment = '-';
  String userExplain = '-';
  int latestNewsID = 0;
  bool isLogout = false;
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
  MasterCompletedInfo(Map<String, dynamic> mapRef, Map<String, dynamic> childMap) : super(mapRef){
    childMap.forEach((childID, map){
      childInfoList.add(ChildDetail(map, childID));
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
    childInfoList.add(ChildDetail({}, targetID));
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
  ChildDetail(Map<String, dynamic> mapRef, String childID){
    this.childID = childID;
    if(mapRef.isNotEmpty){
      if(mapRef['child_order'] != null) orderUnitList.initSelectUnit(mapRef['child_order']);
      if(mapRef['child_icon'] != null) this.iconPath = mapRef['child_icon'];
      if(mapRef['child_name'] != null) this.name = mapRef['child_name'];
      if(mapRef['child_birth'] != null) this.birth = mapRef['child_birth'];
      if(mapRef['child_fav'] != null) this.favoriteFood = mapRef['child_fav'];
      if(mapRef['child_hate'] != null) this.hateFood = mapRef['child_hate'];
      if(mapRef['child_aller'] != null) this.allergy = mapRef['child_aller'];
      if(mapRef['child_person'] != null) this.personality = mapRef['child_person'];
      if(mapRef['child_exe'] != null) this.etc = mapRef['child_exe'];
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