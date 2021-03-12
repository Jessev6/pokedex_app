import 'package:flutter/material.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: Text("Pokedex")
        ),
      ),
    );
  }
}
