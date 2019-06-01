import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseAuth {
  Future<String> signUp(String email, String password);

  Future<String> signIn(String email, String password);

  Future<String> currentUser();

  Future<void> signOut();

  createData(_nic, _nexus, userId);
}

class Auth implements BaseAuth {
  Future<String> signUp(String email, String password) async {
    FirebaseUser user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }

  Future<String> signIn(String email, String password) async {
    FirebaseUser user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }

  Future<String> currentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }

  Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }

//  createData(_nic, _nexus, userId) {
//    DocumentReference docref = Firestore.instance.document("Data/userData");
//    Map<String, dynamic> details = {
//      "userId": userId,
//      "NIC": _nic,
//      "Nexus": _nexus
//    };
//    docref.setData(details).whenComplete(() {
//      print("done");
//    });
//  }

}
