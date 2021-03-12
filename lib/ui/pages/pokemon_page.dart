import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.dart';
import 'package:pokedex_app/ui/view/pokemon_view.dart';
import 'package:provider/provider.dart';

class PokemonPage extends Page {
  final Pokemon pokemon;

  PokemonPage({
    @required this.pokemon,
  });

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return Provider.value(
          value: pokemon,
          child: PokemonView(),
        );
      }
    );
  } 
}
