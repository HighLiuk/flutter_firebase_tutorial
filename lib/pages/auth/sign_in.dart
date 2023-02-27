import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/services/auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService _auth = AuthService();

  Future<void> _signInAnon() async {
    final result = await _auth.signInAnon();

    if (result == null) {
      print('Error signing in');
    } else {
      print('Signed in');
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 20,
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.brown[50]),
            foregroundColor: MaterialStateProperty.all(Colors.grey[900]),
          ),
          onPressed: _signInAnon,
          child: const Text('Sign In anonymously'),
        ),
      ),
    );
  }
}
