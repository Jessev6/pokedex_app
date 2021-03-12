import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.dart';
import 'package:pokedex_app/ui/components/pokemon/sprites.dart';
import 'package:provider/provider.dart';

class PokemonView extends StatelessWidget {
  const PokemonView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Pokemon>(
      builder: (context, pokemon, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(pokemon.name),
            centerTitle: true,
            elevation: 0,
          ),
          body: PokemonSprites(),
        );
      }
    );
  }
}