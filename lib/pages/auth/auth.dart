import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/pages/auth/sign_in.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return const SignInPage();
  }
}
