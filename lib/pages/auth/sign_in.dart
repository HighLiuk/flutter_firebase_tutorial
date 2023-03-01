import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/services/auth.dart';
import 'package:net_ninja_firebase/state/with_email_and_password.dart';
import 'package:net_ninja_firebase/widgets/loading.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends StateWithEmailAndPassword<SignInPage> {
  final AuthService _auth = AuthService();

  String error = '';
  bool loading = false;

  Future<void> _signIn() async {
    setState(() {
      loading = true;
    });

    final result = await _auth.signIn(email, password);

    if (result != null) {
      return;
    }

    setState(() {
      error = 'Error signing in';
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Loading();
    }

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
          const SizedBox(height: 20),
          _errorText(),
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

        await _signIn();
      },
      child: const Text(
        'SIGN IN',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Text _errorText() {
    return Text(
      error,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 14,
      ),
    );
  }
}
