import 'package:flutter/material.dart';

abstract class StateWithEmailAndPassword<T extends StatefulWidget>
    extends State<T> {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool get isValid => formKey.currentState?.validate() ?? false;

  TextFormField emailField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an email';
        }

        if (!value.contains('@')) {
          return 'Please enter a valid email';
        }

        return null;
      },
      onChanged: (value) {
        setState(() {
          email = value;
        });
      },
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  TextFormField passwordField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }

        if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }

        return null;
      },
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );
  }
}
