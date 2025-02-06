import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Sign up with Email and Password
  Future<User?> signUpWithEmailAndPassword({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  // Phone number verification and linking to the account
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(String, int?) codeSent,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String) codeAutoRetrievalTimeout,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.currentUser?.linkWithCredential(credential);
        verificationCompleted(credential);
      },
      verificationFailed: verificationFailed,
      codeSent: (verificationId, resendToken) {
        codeSent(verificationId, resendToken);
      },
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  // Link phone number with current user
  Future<void> linkPhoneNumberWithCredential(PhoneAuthCredential credential) async {
    try {
      await _firebaseAuth.currentUser?.linkWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }
}

// Riverpod provider for AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
