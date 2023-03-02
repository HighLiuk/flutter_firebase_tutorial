import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/models/brew.dart';
import 'package:net_ninja_firebase/models/user.dart';
import 'package:net_ninja_firebase/services/auth.dart';
import 'package:net_ninja_firebase/services/database.dart';
import 'package:net_ninja_firebase/widgets/brew_list.dart';
import 'package:net_ninja_firebase/widgets/settings_form.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    return StreamProvider<List<Brew>>.value(
      initialData: const [],
      value: DatabaseService(user!.uid).brewsStream,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0,
          title: const Text('Brew Crew'),
          actions: [
            _logout(),
            _settings(context),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const BrewList(),
        ),
      ),
    );
  }

  Widget _menu({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return TextButton.icon(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      icon: Icon(icon),
      label: Text(label),
      onPressed: onPressed,
    );
  }

  Widget _logout() {
    return _menu(
      icon: Icons.person,
      label: 'Logout',
      onPressed: () async {
        await _auth.signOut();
      },
    );
  }

  Widget _settings(BuildContext context) {
    return _menu(
      icon: Icons.settings,
      label: 'Settings',
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: _modalBuilder,
        );
      },
    );
  }

  Widget _modalBuilder(context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 20,
      ),
      child: const SettingsForm(),
    );
  }
}
