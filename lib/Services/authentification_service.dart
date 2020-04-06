import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:varisty_shuttle_service/Services/dialog_service.dart';
import 'package:varisty_shuttle_service/home/home_view.dart';


final DialogService _dialogService = DialogService();

class AuthentificationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  
   Future<FirebaseUser> handleSignInwithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user = (await _firebaseAuth.signInWithCredential(credential)).user;
        print("signed in " + user.displayName);
        PageTransition(type: PageTransitionType.fade, child: HomeView());
        return user;
      


    } catch (error) {
      return(error);
    }
  }

  Future loginModel(var result) async{
    if(result is bool) {
      if(result) {
        PageTransition(child: HomeView(), type: PageTransitionType.fade);
      } else {
        await _dialogService.showDialog(
          title : 'Sign in Failure',
          description: 'General Sign in failure, Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign inFailure',
        description: result,
      );
    }
    
  }

  Future loginwithEmail({
    @required String email,
    @required String password,
  }
  ) async {
    try{
      var user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
        );
       loginModel(user);
       return user != null;
    }catch(e){
      return e.message;
    }
  }

  Future signupModel(var result) async{
    if(result is bool) {
      if(result) {
        PageTransition(child: HomeView(), type: PageTransitionType.fade);
      } else {
        await _dialogService.showDialog(
          title : 'Sign up Failure',
          description: 'General sign up failure, Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign up Failure',
        description: result,
      );
    }
    
  }

  Future signUpWithEmail({
    @required String name,
    @required String email,
    @required String password,
  }) async {
    try {
      
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
        );
        FirebaseUser user = authResult.user;
        UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
        userUpdateInfo.displayName = name; 
        print("-------signed in ------" + user.displayName);
        signupModel(authResult);
        return user != null;
    }catch (e){
      return e.message();
    }
  }


}