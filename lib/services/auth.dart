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

  Future<User?> signInAnon() async {
    try {
      final result = await _auth.signInAnonymously();

      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());

      return null;
    }
  }
}
