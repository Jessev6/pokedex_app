import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({
    Key key, 
    @required this.pokemon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(pokemon.name),
      ),
    );
  }
}

