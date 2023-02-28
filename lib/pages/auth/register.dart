import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/state/with_email_and_password.dart';
import 'package:net_ninja_firebase/services/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends StateWithEmailAndPassword<RegisterPage> {
  final AuthService _auth = AuthService();

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
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          emailField(),
          const SizedBox(height: 20),
          passwordField(),
          const SizedBox(height: 20),
          _registerButton(),
        ],
      ),
    );
  }

  ElevatedButton _registerButton() {
    return ElevatedButton(
      onPressed: () async {
        if (!isValid) {
          return;
        }

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
