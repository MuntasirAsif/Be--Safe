import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

final loginProvider = StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController();
});

class LoginState {
  final String email;
  final bool isLoggedIn;
  final String errorMessage;
  final bool isLoading;

  LoginState({
    required this.email,
    this.isLoggedIn = false,
    this.errorMessage = '',
    this.isLoading = false,
  });

  // Create a copyWith method to update parts of the state while preserving the rest.
  LoginState copyWith({
    String? email,
    bool? isLoggedIn,
    String? errorMessage,
    bool? isLoading,
  }) {
    return LoginState(
      email: email ?? this.email,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginState(email: ''));

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        // Set loading state to true
        state = state.copyWith(isLoading: true, errorMessage: '');

        // Perform login
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Set login success state
        state = state.copyWith(isLoggedIn: true, isLoading: false);
      } catch (e) {
        // Set error state with a more user-friendly error message
        String errorMessage = _getFirebaseAuthErrorMessage(e);

        // Set error state
        state = state.copyWith(
          isLoggedIn: false,
          errorMessage: errorMessage,
          isLoading: false,
        );
      }
    } else {
      // Handle case when email or password is empty
      state = state.copyWith(
        errorMessage: 'Email and password cannot be empty.',
        isLoading: false,
      );
    }
  }

  // Helper function to handle Firebase errors
  String _getFirebaseAuthErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'invalid-email':
          return 'The email address is badly formatted.';
        case 'user-not-found':
          return 'No user found with this email.';
        case 'wrong-password':
          return 'Incorrect password provided.';
        default:
          return 'An error occurred. Please try again.';
      }
    }
    return 'An unknown error occurred.';
  }
}
