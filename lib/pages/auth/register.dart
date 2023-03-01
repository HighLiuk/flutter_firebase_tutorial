import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/state/with_email_and_password.dart';
import 'package:net_ninja_firebase/services/auth.dart';
import 'package:net_ninja_firebase/widgets/loading.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends StateWithEmailAndPassword<RegisterPage> {
  final AuthService _auth = AuthService();

  String error = '';
  bool loading = false;

  Future<void> _register() async {
    setState(() {
      loading = true;
    });

    final result = await _auth.register(email, password);

    if (result != null) {
      return;
    }

    setState(() {
      error = 'Error registering';
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
          _registerButton(),
          const SizedBox(height: 20),
          _errorText(),
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

        await _register();
      },
      child: const Text(
        'REGISTER',
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
