import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/services/auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

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
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: const Text('Sign in to Brew Crew'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 20,
        ),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _emailField(),
              const SizedBox(height: 20),
              _passwordField(),
              const SizedBox(height: 20),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _emailField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
      onChanged: (value) {
        setState(() {
          email = value;
        });
      },
    );
  }

  TextFormField _passwordField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
      obscureText: true,
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
    );
  }

  ElevatedButton _signInButton() {
    return ElevatedButton(
      onPressed: () async {
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
