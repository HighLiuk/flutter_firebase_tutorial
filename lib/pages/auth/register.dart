import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/services/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  Future<void> _register(
    String email,
    String password,
  ) async {
    final result = await _auth.register(email, password);

    if (result == null) {
      print('Error registering');

      return;
    }

    print('Registered');
    print(result);

    await _auth.signIn(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: const Text('Register to Brew Crew'),
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
              _registerButton(),
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

  ElevatedButton _registerButton() {
    return ElevatedButton(
      onPressed: () async {
        await _register(email, password);
      },
      child: const Text(
        'REGISTER',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
