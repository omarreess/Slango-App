


 import 'package:Slango/model/User.dart'as u;
import 'package:firebase_auth/firebase_auth.dart' ;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:toast/toast.dart';

import 'Cloud.dart';

class Auth
{
   String name ;
  String mail ;
  String uid ;
  String password ;
  String img ;
  int likes ;
    bool firstCheck  ;
    FirebaseAuth _firebaseAuth;
    BuildContext ctx;

 Auth ({this.ctx , this.firstCheck=false }) {
   }

  Future<void> initFb () async {
    _firebaseAuth = await FirebaseAuth.instance;
  if(firstCheck) if (_firebaseAuth.currentUser!= null) {
   // print(_firebaseAuth.currentUser.uid)
    Navigator.pushReplacementNamed(ctx, 'home');}

  }

  void login(String mail , String pass ) async{

      try {
        UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
            email: mail,
            password: pass
        );

        Navigator.pushReplacementNamed(ctx, 'home');

      }
      on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Toast.show('No user found for that email', ctx, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

         } else if (e.code == 'wrong-password') {
          Toast.show('Wrong password provided for that user', ctx, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

         }
      }


  }

    Future<int>  logout( ) async {
      await _firebaseAuth.signOut();
      Navigator.popAndPushNamed(ctx, 'login');

   }
    Future<String >  getUserUid( ) async {

      await initFb().then((value)  {uid = _firebaseAuth.currentUser.uid.toString();});
       return uid ;



   }

  Future<bool> signup(String mail , String pass , String name)async{
    try {
      _firebaseAuth.createUserWithEmailAndPassword(email: mail, password: pass).then(
              (user) {
                _firebaseAuth.currentUser.sendEmailVerification();
                //set user name in cloud
                CloudDb().postUserName(u.User(uid:_firebaseAuth.currentUser.uid.toString() ,score: 0 , name: name ));


              }
      );

       return true;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Toast.show('The password provided is too weak', ctx, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        return false ;
      } else if (e.code == 'email-already-in-use') {
         Toast.show('The account already exists for that email', ctx, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        return false;
      }
    } catch (e) {

           return false ;
    }


  }

  void forgetPass(String mail){
    _firebaseAuth.sendPasswordResetEmail(email: mail);

  }


}


//to use
//Auth auth ;

//init auth fb
//auth = Auth(ctx: context);
//auth.initFb();
//