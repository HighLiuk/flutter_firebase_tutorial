import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/services/auth.dart';
import 'package:net_ninja_firebase/state/with_email_and_password.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends StateWithEmailAndPassword<SignInPage> {
  final AuthService _auth = AuthService();

  Future<void> _signIn(
    String email,
    String password,
  ) async {
    final result = await _auth.signIn(email, password);

    if (result == null) {
      print('Error signing in');
    } else {
      print('Signed in');
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          emailField(),
          const SizedBox(height: 20),
          passwordField(),
          const SizedBox(height: 20),
          _signInButton(),
        ],
      ),
    );
  }

  ElevatedButton _signInButton() {
    return ElevatedButton(
      onPressed: () async {
        if (!isValid) {
          return;
        }

        await _signIn(email, password);
      },
      child: const Text(
        'SIGN IN',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
