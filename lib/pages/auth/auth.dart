import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/pages/auth/register.dart';
import 'package:net_ninja_firebase/pages/auth/sign_in.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showSignIn = true;

  @override
  Widget build(BuildContext context) {
    final page = showSignIn ? const SignInPage() : const RegisterPage();

    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text(
          showSignIn ? 'Sign In to Brew Crew' : 'Register to Brew Crew',
        ),
        actions: [
          _action(context),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 20,
        ),
        child: page,
      ),
    );
  }

  TextButton _action(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        setState(() {
          showSignIn = !showSignIn;
        });
      },
      icon: const Icon(
        Icons.person,
        color: Colors.white,
      ),
      label: Text(
        showSignIn ? 'Register' : 'Sign In',
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
