import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/services/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: const Text('Brew Crew'),
        actions: [
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            icon: const Icon(Icons.person),
            label: const Text('Logout'),
            onPressed: _auth.signOut,
          ),
        ],
      ),
      body: Container(),
    );
  }
}
