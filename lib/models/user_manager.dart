import 'package:etecfood/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helpers/firebase_errors.dart';

class UserManager extends ChangeNotifier
{
  final FirebaseAuth  auth = FirebaseAuth.instance;
  User? currentUser;

  Future signIn({required UserModel user, required Function onFail, required Function onSuccess}) async {
    try 
    {
       final UserCredential result = await auth.signInWithEmailAndPassword(email: user.email!, password: user.password!);
      currentUser = result.user;
      onSuccess();
    }on FirebaseAuthException catch (e) 
    {
      onFail(getErrorString(e.code));
    }
   
  }

  Future<void> loadCurrentUser() async
  {
    auth.authStateChanges().listen((User? user) {
      if(user != null)
      {
        currentUser = user;
        debugPrint(currentUser!.uid);
      }
      notifyListeners();
     });
  }
}