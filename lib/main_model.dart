import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mapako02/utility/master.dart';


enum LoginState{
  Disconnected,
  RequireLogin,
  CompletedLogin,
}
class MainModel{
  Future<LoginState> getLoginState() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    Connectivity connectivity = Connectivity();
    LoginState loginState = LoginState.RequireLogin;

    ConnectivityResult connectivityResult = await connectivity.checkConnectivity();
    if(connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      if(auth.currentUser != null){
        loginState = LoginState.CompletedLogin;
      }
      else{
        loginState = LoginState.RequireLogin;
      }
    }
    else{
      loginState = LoginState.Disconnected;
    }
    return loginState;
  }

  Future<bool> isTutorialSeen() async{
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if(userId != null){
      final docRef = FirebaseFirestore.instance.collection('users');
      final DocumentSnapshot docSnap = await docRef.doc(userId).get();
      final Map<String, dynamic> userMap = await docSnap.get('user_info');
      final userCompletedInfo = MasterPartialInfo(userMap, userId);
      return userCompletedInfo.isTutorialSeen;
    }
    return false;
  }
}