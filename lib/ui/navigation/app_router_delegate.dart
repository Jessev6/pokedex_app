import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.dart';
import 'package:pokedex_app/ui/navigation/app_route_path.dart';
import 'package:pokedex_app/ui/pages/menu_page.dart';
import 'package:pokedex_app/ui/pages/pokedex_page.dart';
import 'package:pokedex_app/ui/pages/pokemon_page.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
  with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
    @override
    GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

    bool _inPokedex = false;
    bool _inDetailScreen = false;
    int _pokemonId = -1;

    Pokemon _pokemon;

    AppRoutePath get currentConfiguration {
      if (_inDetailScreen) {
        return AppRoutePath.detail(_pokemonId);
      }

      if (_inPokedex) {
        return AppRoutePath.pokedex();
      }

      return AppRoutePath.menu();
    }

    _navigateToPokedex() {
      _inPokedex = true;
      notifyListeners();
    }

    _openDetail(Pokemon pokemon) {
      _pokemon = pokemon;
      _pokemonId = pokemon.id;
      _inDetailScreen = true;
      notifyListeners();
    }

    @override
    Widget build(BuildContext context) {
      return Navigator(
        key: navigatorKey,
        pages: [
          MenuPage(openPokedex: _navigateToPokedex),
          if (_inPokedex) PokedexPage(
            onPokemonSelected: _openDetail
          ),
          if (_inDetailScreen) PokemonPage(
            pokemon: _pokemon
          ),
        ],

        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          if (_inDetailScreen) {
            _inDetailScreen = false;
            _pokemonId = -1;
            _pokemon = null;

            notifyListeners();
            return true;
          }

          if (_inPokedex) {
            _inPokedex = false;

            notifyListeners();
            return true;
          }

          notifyListeners();
          return true;
        },
      );
    }
  


  
    @override
    Future<void> setNewRoutePath(AppRoutePath path) {
      // TODO
      if (path.isPokedex) {
        _inPokedex = true;
      }

      return Future.value();
  }
}