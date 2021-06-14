import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_web/utils/function.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      final userResult = await _auth.signInWithCredential(credential);
    } catch (e) {}
  }

  Stream get statusUser {
    return _auth.authStateChanges();
  }

  Future<void> signInWithEmailAndPassword(
      {@required String email, @required String password}) async {
    try {
      print("email: $email  password: $password");
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(credential.user);
      message("Connexion éffectué avec succès");
    } catch (e) {
      print(e);
      errorMessage(e);
    }
  }

  Future<void> signUpWithEmailAndPassword(
      {@required String email, @required String password}) async {
    try {
      print("email: $email  password: $password");
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      message("Votre compte à été crée avec succès");
    } on FirebaseAuthException catch (e) {
      print(e.message);
      errorMessage(e);
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {}
  }

  void errorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case "user-not-found":
        message("Le compte n'existe pas", backgroundColor: Colors.green);
        break;
      case 'wrong-password':
        message("Le nom d'utilisateur ou mot de passe incorrect",
            backgroundColor: Colors.red);
        break;
      case 'weak-password':
        message("Le mot de passe doit être de 6 caractère minimum",
            backgroundColor: Colors.red);
        break;
      case '':
        message("Erreur connexion internet", backgroundColor: Colors.red);
        break;
      case "email-already-in-use":
        message("L'adresse email est déjà utilisé",
            backgroundColor: Colors.red);
        break;
      default:
        print('Case ${e.message} is not yet implemented');
    }
  }
}
