import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:net_ninja_firebase/models/user.dart';
import 'package:net_ninja_firebase/services/database.dart';

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

  Future<User?> register(
    String email,
    String password,
  ) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = _userFromFirebaseUser(result.user);

      if (user == null) {
        return null;
      }

      final db = DatabaseService(user.uid);

      await db.updateUserData('0', 'new crew member', 100);

      return user;
    } catch (e) {
      print(e.toString());

      return null;
    }
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
