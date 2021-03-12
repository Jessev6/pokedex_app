
import 'package:pokedex_app/data/models/pokemon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PokemonRepository {
  Future<List<Pokemon>> getPokemon(int limit, int offset) async {
    final uri = Uri.https(
      "pokeapi.co",
      "/api/v2/pokemon",
      {
        'limit': limit.toString(),
        'offset': offset.toString(),
      }
    );

    var response = await http.get(uri);
    if (response.statusCode != 200)
      throw Exception("Could not fetch pokemon");

    var jsonResponse = convert.jsonDecode(response.body);
    var pokemon = jsonResponse["results"]
      .map((result) => Pokemon(name: result["name"]))
      .toList()
      .cast<Pokemon>();

    return pokemon;
  }
}