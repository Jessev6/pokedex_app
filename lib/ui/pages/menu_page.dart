import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/view/menu_view.dart';
import 'package:provider/provider.dart';

class MenuPage extends Page {
  final Function openPokedex;

  MenuPage({
    @required this.openPokedex,
  });

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return Provider.value(
          value: openPokedex, 
          child: MenuView(),
        );
      }
    );
  }
}
