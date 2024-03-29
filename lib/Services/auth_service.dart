import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/UserModel.dart';

class AuthService{

  final FirebaseAuth _auth =FirebaseAuth.instance;

  static saveToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token != null ){
      prefs.setString('token', token);
    }
  }
  static remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  UserModel? _userModelFromFirebase(User? user){
    if (user != null){
      return UserModel(uid: user.uid);
    } else {
      return null;
    }
  }

  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      saveToken(user?.uid);
    return _userModelFromFirebase(user);
    } catch(e){
      return null;
    }
  }

  //sing in with email & password
  Future signIn(String email, String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //sing out
  Future signOut() async{
    remove();
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

}