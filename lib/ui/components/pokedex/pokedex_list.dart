import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import 'package:pokedex_app/ui/components/pokedex/pokemon_card.dart';

class PokedexList extends StatefulWidget {
  PokedexList({Key key}) : super(key: key);

  @override
  _PokedexListState createState() => _PokedexListState();
}

class _PokedexListState extends State<PokedexList> {
  final _pokemonRepository = PokemonRepository();

  List<Pokemon> pokemons = [];

  int get pokemonCount => this.pokemons.length;
  final limit = 30;

  @override
  void initState() { 
    super.initState();
    loadPokemon();
  }

  loadPokemon() async {
    var pokemons = await _pokemonRepository.getPokemon(limit, pokemonCount);
    setState(() {
      this.pokemons.addAll(pokemons);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: pokemons
        .map((p) => PokemonCard(pokemon: p,)).toList()
      ,
    );
  }
}