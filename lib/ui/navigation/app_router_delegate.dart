import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/navigation/app_route_path.dart';
import 'package:pokedex_app/ui/pages/menu_page.dart';
import 'package:pokedex_app/ui/pages/pokedex_page.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
  with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
    @override
    GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

    bool _inPokedex = false;

    AppRoutePath get currentConfiguration {
      if (_inPokedex) {
        return AppRoutePath.pokedex();
      }

      return AppRoutePath.menu();
    }

    _navigateToPokedex() {
      _inPokedex = true;
      notifyListeners();
    }

    @override
    Widget build(BuildContext context) {
      return Navigator(
        key: navigatorKey,
        pages: [
          MenuPage(openPokedex: _navigateToPokedex),
          if (_inPokedex) PokedexPage()
        ],

        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          if (_inPokedex) {
            _inPokedex = false;
          }

          notifyListeners();
          return true;
        },
      );
    }
  


  
    @override
    Future<void> setNewRoutePath(AppRoutePath path) {
      if (path.isPokedex) {
        _inPokedex = true;
      }

      return Future.value();
  }
}