import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/common/input_decoration.dart';
import 'package:net_ninja_firebase/models/user.dart';
import 'package:net_ninja_firebase/models/user_data.dart';
import 'package:net_ninja_firebase/services/database.dart';
import 'package:net_ninja_firebase/widgets/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // Form fields
  String? _name;
  String? _sugars;
  int? _strength;

  bool get isValid => formKey.currentState?.validate() ?? false;

  Stream<UserData> _userDataStream(BuildContext context) {
    final user = Provider.of<User>(context);

    return DatabaseService(user.uid).userDataStream;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _userDataStream(context),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Loading();
        }

        final userData = snapshot.data as UserData;

        _name ??= userData.name;
        _sugars ??= userData.sugars;
        _strength ??= userData.strength;

        return Form(
          key: formKey,
          child: Column(
            children: [
              _title,
              const SizedBox(height: 20),
              _nameField,
              const SizedBox(height: 20),
              _sugarsField,
              const SizedBox(height: 20),
              _strengthField,
              const SizedBox(height: 20),
              _submitButton(context),
            ],
          ),
        );
      },
    );
  }

  Widget get _title {
    return const Center(
      child: Text(
        'Update your brew settings',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  TextFormField get _nameField {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
      initialValue: _name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a name';
        }

        return null;
      },
      decoration: inputDecoration('Name'),
    );
  }

  DropdownButtonFormField<String> get _sugarsField {
    return DropdownButtonFormField(
      onChanged: (value) {
        setState(() {
          _sugars = value ?? _sugars;
        });
      },
      value: _sugars,
      items: sugars.map(_sugarOption).toList(),
      decoration: inputDecoration(''),
    );
  }

  DropdownMenuItem<String> _sugarOption(sugar) {
    return DropdownMenuItem(
      value: sugar,
      child: Text('$sugar sugars'),
    );
  }

  Slider get _strengthField {
    return Slider(
      onChanged: (value) {
        setState(() {
          _strength = value.round();
        });
      },
      value: _strength?.toDouble() ?? 100,
      min: 100,
      max: 900,
      divisions: 8,
      activeColor: Colors.brown[_strength ?? 100],
      inactiveColor: Colors.brown[_strength ?? 100],
    );
  }

  ElevatedButton _submitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (!isValid) {
          return;
        }

        final user = Provider.of<User>(context, listen: false);

        await DatabaseService(
          user.uid,
        ).updateUserData(
          _sugars!,
          _name!,
          _strength!,
        );

        if (!mounted) {
          return;
        }

        Navigator.pop(context);
      },
      child: const Text(
        'Update',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
