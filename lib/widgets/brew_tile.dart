import 'package:flutter/material.dart';
import 'package:net_ninja_firebase/models/brew.dart';

class BrewTile extends StatelessWidget {
  const BrewTile({
    super.key,
    required this.brew,
  });

  final Brew brew;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: _tile,
      ),
    );
  }

  ListTile get _tile {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.brown[brew.strength],
      ),
      title: Text(brew.name),
      subtitle: Text(
        'Takes ${brew.sugars} sugar(s)',
      ),
    );
  }
}
