import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/components/pokedex/pokedex_list.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PokedexList(),
    );
  }
}
