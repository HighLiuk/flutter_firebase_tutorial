import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/models/brew.dart';
import 'package:net_ninja_firebase/widgets/brew_tile.dart';
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

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, i) => BrewTile(brew: brews[i]),
    );
  }
}
