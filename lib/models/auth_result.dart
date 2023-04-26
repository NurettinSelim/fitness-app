import 'package:firebase_auth/firebase_auth.dart';

class AuthResult {
  AuthResult({this.userCredential, this.authError});
  final UserCredential? userCredential;
  final AuthError? authError;
}

class AuthError {
  AuthError({this.errorMessage, this.errorCode});
  final String? errorMessage;
  final String? errorCode;

  @override
  String toString() {
    if (errorCode != null) {
      return "Error Code: '$errorCode' | Error Message: '$errorMessage'";
    }
    return "Error Message: '$errorMessage'";
  }
}
