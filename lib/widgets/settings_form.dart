import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/common/input_decoration.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // Form fields
  String _name = '';
  String _sugars = '0';
  int _strength = 100;

  bool get isValid => formKey.currentState?.validate() ?? false;

  @override
  Widget build(BuildContext context) {
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
          _submitButton,
        ],
      ),
    );
  }

  Text get _title {
    return const Text(
      'Update your brew settings',
      style: TextStyle(fontSize: 18),
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
      value: _strength.toDouble(),
      min: 100,
      max: 900,
      divisions: 8,
      activeColor: Colors.brown[_strength],
      inactiveColor: Colors.brown[_strength],
    );
  }

  ElevatedButton get _submitButton {
    return ElevatedButton(
      onPressed: () {
        if (!isValid) {
          return;
        }

        print('$_name, $_sugars, $_strength');
      },
      child: const Text(
        'Update',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
