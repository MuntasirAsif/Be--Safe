import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth_repository/SignUpRepository.dart';

class SignUpController extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _authRepository;

  SignUpController(this._authRepository) : super(const AsyncData(null));

  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    try {
      await _authRepository.signUpWithEmailAndPassword(email: email, password: password);
      state = const AsyncData(null);
    } catch (e, stackTrace) {
      // Use Exception or Error type for better compatibility
      state = AsyncValue.error(Exception('SignUp failed: $e'),stackTrace);
    }
  }

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(String, int?) codeSent,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String) codeAutoRetrievalTimeout,
  }) async {
    state = const AsyncLoading();
    try {
      await _authRepository.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        codeSent: codeSent,
        verificationFailed: verificationFailed,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
      state = const AsyncData(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(Exception('Phone verification failed: $e'), stackTrace);
    }
  }

  Future<void> linkPhoneWithCode({
    required String verificationId,
    required String smsCode,
  }) async {
    state = const AsyncLoading();
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _authRepository.linkPhoneNumberWithCredential(credential);
      state = const AsyncData(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(Exception('Phone linking failed: $e'),stackTrace);
    }
  }
}

// Riverpod provider for SignUpController
final signUpControllerProvider =
StateNotifierProvider<SignUpController, AsyncValue<void>>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return SignUpController(authRepository);
});
