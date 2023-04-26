import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logging/logging.dart';
import 'package:fitness_app/core/routes/router.dart';
import 'package:fitness_app/models/auth_result.dart';

final authProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.userChanges();
});

class AuthService {
  final log = Logger("authService");

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  User? get user => _auth.currentUser;

  Future<AuthResult> registerWithEmail(
    BuildContext context,
    String email,
    String pass,
    String name,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: pass);

      userCredential.user?.updateDisplayName(name);

      return AuthResult(userCredential: userCredential);
    } on FirebaseAuthException catch (e) {
      return AuthResult(
        authError: AuthError(
          errorMessage: e.message,
          errorCode: e.code,
        ),
      );
    }
  }

  Future<AuthResult> anonSignIn(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      if (context.mounted) {
        context.goNamed(Routes.home.name);
      }
      return AuthResult(userCredential: userCredential);
    } on FirebaseAuthException catch (e) {
      return AuthResult(
        authError: AuthError(
          errorMessage: e.message,
          errorCode: e.code,
        ),
      );
    } catch (e) {
      log.warning(e.toString());
      return AuthResult(authError: AuthError(errorMessage: e.toString()));
    }
  }

  Future<AuthResult> signInWithEmail(
    BuildContext context,
    String email,
    String pass,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      if (context.mounted) {
        context.goNamed(Routes.home.name);
      }
      return AuthResult(userCredential: userCredential);
    } on FirebaseAuthException catch (e) {
      return AuthResult(
        authError: AuthError(
          errorMessage: e.message,
          errorCode: e.code,
        ),
      );
    } catch (e) {
      log.warning(e.toString());
      return AuthResult(authError: AuthError(errorMessage: e.toString()));
    }
  }

  Future<AuthResult> signInGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        //TODO edit here
        throw Exception("Login was aborted");
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (context.mounted) {
        context.goNamed(Routes.home.name);
      }
      return AuthResult(userCredential: userCredential);
    } on FirebaseAuthException catch (e) {
      return AuthResult(
        authError: AuthError(
          errorMessage: e.message,
          errorCode: e.code,
        ),
      );
    }
  }

  //sign out
  Future signOut(BuildContext context) async {
    try {
      await _auth.signOut();

      if (context.mounted) {
        context.goNamed(Routes.login.name);
      }
      return;
    } catch (e) {
      log.warning(e.toString());
      return null;
    }
  }
}
