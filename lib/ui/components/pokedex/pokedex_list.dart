import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import 'package:pokedex_app/ui/components/pokedex/pokemon_card.dart';

const Max = 898;
const PageSize = 30;

class PokedexList extends StatefulWidget {
  PokedexList({Key key}) : super(key: key);

  @override
  _PokedexListState createState() => _PokedexListState();
}

class _PokedexListState extends State<PokedexList> {
  final _controller = ScrollController();

  final _pokemonRepository = PokemonRepository();

  List<Pokemon> pokemons = [];

  int get pokemonCount => this.pokemons.length;
  int get limit => Max - this.pokemonCount - PageSize <= 0 ? Max - this.pokemonCount : PageSize;

  @override
  void initState() { 
    super.initState();
    loadPokemon();
    _controller.addListener(() {
      if (
        _controller.offset >= _controller.position.maxScrollExtent 
          && !_controller.position.outOfRange
      ) {
          loadPokemon();
        }
    });
  }

  loadPokemon() async {
    if (pokemonCount >= Max) return;
    debugPrint("loadPokemon called");
    var pokemons = await _pokemonRepository.getPokemon(limit, pokemonCount);
    setState(() {
      this.pokemons.addAll(pokemons);
      loadPokemonDetails();
    });
  }

  loadPokemonDetails() {
    this.pokemons
      .asMap()
      .forEach((index, value) async { 
        if (value.detailsLoaded != null && value.detailsLoaded) return;
        var pokemon = await _pokemonRepository.getDetails(value);
        setState(() {
          this.pokemons[index] = pokemon;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      controller: _controller,
      crossAxisCount: 3,
      children: pokemons
        .map((p) => PokemonCard(pokemon: p,)).toList()
      ,
    );
  }
}