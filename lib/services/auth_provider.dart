import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool _isLoading = false;

  Stream<User?> stream() => firebaseAuth.authStateChanges();
  bool get loading => _isLoading;

  Future<String> registration(
      {required String email, required String password}) async {
    try {
      _isLoading = true;
      notifyListeners();
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return "Success";
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      notifyListeners();
      if (e.code == "weak-password") {
        return "The password provided is too week ";
      } else if (e.code == "email-already-in-use") {
        return "An Account already exsists in this email";
      } else if (e.code == "empty") {
        return "empty";
      } else if (e.code == "network-request-failed") {
        return "No internet";
      } else {
        return Future.value(e.message);
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> signIn({required email, required password}) async {
    try {
      _isLoading = true;
      notifyListeners();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      notifyListeners();
      if (e.code == "wrong-password") {
        return "password not correct";
      } else if (e.code == "user-not-found") {
        return "No user found this email";
      } else if (e.code == "empty-or-null") {
        return "empty";
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
