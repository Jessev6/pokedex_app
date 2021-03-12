import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.dart';
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
          ),
          body: Center(child: Text(pokemon.name),),
        );
      }
    );
  }
}