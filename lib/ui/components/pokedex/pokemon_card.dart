import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.dart';
import 'package:provider/provider.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({
    Key key, 
    @required this.pokemon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Function>(
      builder: (context, onPokemonSelected, child) {
        return GestureDetector(
          onTap: () => onPokemonSelected(pokemon),
          child: Card(
            child: Stack(
              children: [
                if (pokemon.sprites != null && pokemon.sprites.frontDefault != null)
                  Center(
                    child: Image.network(pokemon.sprites.frontDefault)
                  )
                else 
                  Center(
                    child: CircularProgressIndicator(),
                  ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(pokemon.name),
                )
              ],
            )
          ),
        );
      }
    );
  }
}

