import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'enum.dart';
import 'master.dart';


/*--------------------------------------
フレンド要請のユニット
---------------------------------------*/
class RequestUnitManager{
  final docRef = FirebaseFirestore.instance.collection('users');
  final uid = FirebaseAuth.instance.currentUser!.uid;

  Future<RequestUnit> getRequestState(List<dynamic> myFriendList, List<dynamic> myRequireList, String searchID) async {
    if(searchID == '') return RequestUnit("ユーザーIDが見つかりませんでした", RequestState.IsNotExist);

    try{
      var targetDoc = await docRef.doc(searchID).get();
      if(!targetDoc.exists){
        return RequestUnit("ユーザーIDが見つかりませんでした", RequestState.IsNotExist);
      }
      if(targetDoc.id == uid){
        return RequestUnit("自身をフレンドリストには追加できません", RequestState.IsSelfID);
      }
      final targetFriendRequireList = await targetDoc.get('friend_require');
      for(var target in targetFriendRequireList){
        if(target.toString() == uid){
          return RequestUnit("申請済みです。承認をお待ちください", RequestState.IsMultipleRequire);
        }
      }
      for(var target in myRequireList){
        if(target.toString() == uid){
          return RequestUnit("申請済みです。承認をお待ちください", RequestState.IsMultipleRequire);
        }
      }
      for(var myFriend in myFriendList){
        if(myFriend.toString() == searchID){
          return RequestUnit("同一ユーザーが既にフレンドリストに追加されています", RequestState.IsInFriendList);
        }
      }
      final requestTarget = MasterPartialInfo(await targetDoc.get('user_info'), null);
      if(requestTarget.isLogout){
        return RequestUnit("ログアウト中のユーザーには申請を行えません", RequestState.IsLogout);
      }
      String name = requestTarget.userName;
      return RequestUnit("$nameさんへフレンド申請を行いますか？", RequestState.Accept);
    }
    catch(exe){
      return RequestUnit("エラーを検知しました。\n入力内容に誤りがないか確認の上、再度申請を行ってください", RequestState.IsNotExist);
    }
  }
}
class RequestUnit{
  RequestUnit(this.logMessage, this.requestState);
  late String logMessage;
  late RequestState requestState;
}
