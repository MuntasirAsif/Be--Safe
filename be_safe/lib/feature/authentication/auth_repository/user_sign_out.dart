import 'package:firebase_auth/firebase_auth.dart';

class UserSignOut{
  final FirebaseAuth _firebaseAuth;

  UserSignOut(this._firebaseAuth);
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}