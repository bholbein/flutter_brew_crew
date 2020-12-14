import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';
import 'package:brew_crew/shared/loading.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    // using canaray operator to check if brews is set already, if not show loading screen
    return brews == null
        ? Loading()
        : ListView.builder(
            itemCount: brews.length,
            itemBuilder: (context, index) {
              return BrewTile(
                brew: brews[index],
              );
            },
          );
  }
}
