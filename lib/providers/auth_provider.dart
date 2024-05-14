import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier{
  String _userKind = "";


  setUserKind(String user){
    this._userKind = user;
    notifyListeners();
  }


 getUserKind(){
   return _userKind;
  }


}