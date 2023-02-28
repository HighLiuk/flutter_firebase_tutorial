import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:net_ninja_firebase/models/user.dart';

class AuthService {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;

  User? _userFromFirebaseUser(firebase_auth.User? user) {
    if (user == null) {
      return null;
    }

    return User(uid: user.uid);
  }

  Stream<User?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future<User?> signIn(
    String email,
    String password,
  ) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
