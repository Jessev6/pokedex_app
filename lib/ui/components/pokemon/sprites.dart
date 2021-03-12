import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.dart';
import 'package:provider/provider.dart';

class PokemonSprites extends StatelessWidget {
  const PokemonSprites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Pokemon>(
      builder: (context, pokemon, child) {
        return Container(
          color: Colors.blue,
          height: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Normal"),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          width: 80,
                          height: 80,
                          color: Colors.white,
                          child: Image.network(
                            pokemon.sprites.frontDefault
                          ),
                        ),
                      ),
                      
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          width: 80,
                          height: 80,
                          color: Colors.white,
                          child: Image.network(
                            pokemon.sprites.backDefault
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Shiny"),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          width: 80,
                          height: 80,
                          color: Colors.white,
                          child: Image.network(
                            pokemon.sprites.frontShiny
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          width: 80,
                          height: 80,
                          color: Colors.white,
                          child: Image.network(
                            pokemon.sprites.backShiny
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )
        );
      },
    );
  }
}
