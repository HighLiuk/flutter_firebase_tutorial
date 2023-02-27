import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInAnon() async {
    try {
      final result = await _auth.signInAnonymously();

      return result.user;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }
}
