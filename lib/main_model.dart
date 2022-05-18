import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';


enum LoginState{
  Disconnected,
  RequireLogin,
  CompletedLogin,
}
class MainModel{

  // TODO ステート確認中はプログレスバーを追加
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
}