import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/view/pokedex_view.dart';
import 'package:provider/provider.dart';

class PokedexPage extends Page {
  final Function onPokemonSelected;

  PokedexPage({
    @required this.onPokemonSelected,
  });

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return Provider.value(
          value: onPokemonSelected,
          child: PokedexView(),
        );
      }
    );
  }
}
