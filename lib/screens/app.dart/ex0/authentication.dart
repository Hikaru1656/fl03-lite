
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Account {
  String? id;
  String? email;
  String? password;
  String? username;

  Account({
   this.id = '', this.email = '', this.password = '', this.username = ''
  });
}



class UserFirestore {
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference users = _firestoreInstance.collection('users');

  static Future<dynamic> setUser(Account newAccount) async{
    try {
      users.doc(newAccount.id).set({
        'id': newAccount.id,
        'email': newAccount.email,
        'username': newAccount.username,
        'password': newAccount.password,
      });
      print('新規ユーザー作成完了');
      return true;
    } on FirebaseException catch(e) {
      print('新規ユーザー作成エラー:$e');
      return false;
    }
  }

  static Future<dynamic> getUser(String uid) async{
    try {
      DocumentSnapshot documentSnapshot = await users.doc(uid).get();
      print('here---start');
      print(uid);
      print(documentSnapshot.data());
      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
      print('1');
      Account myAccount = Account(
        id: uid,
        email: data['email'],
        username: data['username'],
        password: data['password'],
      );
      print('2');
      Authentication.myAccount = myAccount;
      print('ユーザー取得完了');
      return true;
    } on FirebaseException catch(e) {
      print('ユーザー取得エラー:$e');
      return false;
    }
  }

}


class Authentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static User? currentUser;
  static Account? myAccount;

  static Future<dynamic> signUp({required String email, required String password}) async{
    try {
      UserCredential newAccount = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      print('auth登録完了');
      return newAccount;
    } on FirebaseAuthException catch(e) {
      print('auth登録エラー:$e');
      return false;
    }
  }
  
  static Future<dynamic> emailSignIn({required String email, required String password}) async{
    try {
      final UserCredential _result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      currentUser = _result.user;
      print('Authサインイン完了');
      return _result;
    } on FirebaseAuthException catch(e) {
      print('Authサインインエラー$e');
      return false;
    }
  }
}
