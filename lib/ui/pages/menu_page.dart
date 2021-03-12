import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/view/menu_view.dart';

class MenuPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return MenuView();
      }
    );
  }
}
