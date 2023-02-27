import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/pages/wrapper.dart';
import 'package:net_ninja_firebase/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: AuthService().user,
      child: const MaterialApp(
        home: WrapperPage(),
      ),
    );
  }
}
