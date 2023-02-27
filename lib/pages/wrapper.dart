import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/models/user.dart';
import 'package:net_ninja_firebase/pages/auth/auth.dart';
import 'package:net_ninja_firebase/pages/home/home.dart';
import 'package:provider/provider.dart';

class WrapperPage extends StatelessWidget {
  const WrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    return user == null ? const AuthPage() : HomePage();
  }
}
