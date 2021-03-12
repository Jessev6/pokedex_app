import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/view/pokedex_view.dart';

class PokedexPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return PokedexView();
      }
    );
  }
  
}
