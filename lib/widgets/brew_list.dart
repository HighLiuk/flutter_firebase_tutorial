import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/models/brew.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);

    for (final brew in brews) {
      print(brew.name);
      print(brew.sugars);
      print(brew.strength);
    }

    return Container();
  }
}
